import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/homescreen/domain/entities/order_entity.dart';
import 'package:tarcking_app/features/order_details/data/models/order_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/api/client/api_client.dart';
import '../../data/models/update_order_state_request_model.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final ApiClient _apiClient;

  OrderDetailsCubit(this._apiClient) : super(OrderDetailsInitial());

  void getOrderDetails(OrderEntity orderEntity) {
    emit(OrderDetailsLoading());
    try {
      final order = OrderDetails.fromOrderEntity(orderEntity);
      emit(OrderDetailsLoaded(order));
    } catch (e) {
      emit(OrderDetailsError('Failed to load order details: $e'));
    }
  }

  Future<void> updateOrderStatus() async {
    if (state is OrderDetailsLoaded) {
      final currentState = state as OrderDetailsLoaded;
      final currentOrder = currentState.order;
      final nextState = getNextState(currentOrder.state);
      if (currentOrder.state == 'canceled' ||
          currentOrder.state == 'completed') {
        return;
      }

      emit(OrderDetailsUpdating(currentOrder));

      try {
        final request = UpdateOrderStateRequest(state: nextState);
        await _apiClient.updateOrderState(currentOrder.id, request);

        final updatedOrder = currentOrder.copyWith(state: nextState);
        emit(OrderDetailsLoaded(updatedOrder));
      } catch (e) {
        emit(OrderDetailsError('Failed to update order status: $e'));
        emit(OrderDetailsLoaded(currentOrder));
      }
    }
  }

  String getNextState(String currentState) {
    switch (currentState) {
      case 'pending':
        return 'inProgress';
      case 'inProgress':
        return 'completed';
      case 'completed':
        return 'completed';
      default:
        return currentState;
    }
  }

  void call(String phoneNumber) async {
    final url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      log("Phone is not installed");
    }
  }

  void shareViaWhatsApp(String phoneNumber) async {
    final cleanedPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final phone =
        cleanedPhone.startsWith('+') ? cleanedPhone : '+$cleanedPhone';
    final url = Uri.parse("https://wa.me/$phone");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      final phoneUrl = Uri.parse("tel:$phone");
      if (await canLaunchUrl(phoneUrl)) {
        await launchUrl(phoneUrl);
      }
    }
  }
}
