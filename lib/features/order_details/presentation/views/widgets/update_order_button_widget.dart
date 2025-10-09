import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/features/order_details/data/models/order_details_model.dart';

import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../cubit/order_details_cubit.dart';

class UpdateOrderButtonWidget extends StatelessWidget {
  final OrderDetails order;
  final bool isUpdating;

  const UpdateOrderButtonWidget({super.key, required this.order, required this.isUpdating});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: double.infinity,
      text: _getButtonText(order.state),
      onPressed:
      isUpdating || order.state == 'canceled' || order.state == 'completed'
          ? null
          : () {
        context.read<OrderDetailsCubit>().updateOrderStatus();
      },
    );
  }

  String _getButtonText(String state) {
    switch (state) {
      case 'pending':
        return 'Arrived at Pickup point';
      case 'inProgress':
        return 'Start deliver';
      case 'Out for delivery':
        return 'Arrived to the user';
      case 'Arrived':
        return 'Delivered to the user';
      case 'Delivered':
        return 'Delivered to the user';
      case 'canceled':
        return 'canceled';
      case 'completed':
        return 'completed';
      default:
        return 'inProgress';
    }
  }
}
