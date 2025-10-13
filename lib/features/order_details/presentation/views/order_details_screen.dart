import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/features/homescreen/domain/entities/order_entity.dart';
import 'package:tarcking_app/features/order_details/data/models/order_details_model.dart';
import 'package:tarcking_app/features/order_details/presentation/views/widgets/order_details_bottom_section.dart';
import 'package:tarcking_app/features/order_details/presentation/views/widgets/order_details_top_section.dart';
import 'package:tarcking_app/features/order_details/presentation/views/widgets/update_order_button_widget.dart';
import '../../../../core/api/client/api_client.dart';
import '../../../../core/config/di.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../cubit/order_details_cubit.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderEntity? orderEntity;

  const OrderDetailsScreen({super.key, this.orderEntity});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return orderEntity == null
        ? const SizedBox()
        : BlocProvider(
          create:
              (context) =>
                  OrderDetailsCubit(getIt<ApiClient>())
                    ..getOrderDetails(orderEntity!),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale?.orderDetails ?? ""),
              backgroundColor: Colors.white,
              centerTitle: false,
              foregroundColor: Colors.black,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
              builder: (context, state) {
                if (state is OrderDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrderDetailsError) {
                  return Center(child: Text(state.message));
                } else if (state is OrderDetailsLoaded ||
                    state is OrderDetailsUpdating) {
                  final order =
                      state is OrderDetailsLoaded
                          ? (state).order
                          : (state as OrderDetailsUpdating).order;
                  return _OrderDetailsContent(
                    order: order,
                    isUpdating: state is OrderDetailsUpdating,
                  );
                } else {
                  return const Center(child: Text('No order data'));
                }
              },
            ),
          ),
        );
  }
}

class _OrderDetailsContent extends StatelessWidget {
  final OrderDetails order;
  final bool isUpdating;

  const _OrderDetailsContent({required this.order, this.isUpdating = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailsTopSection(order: order, address: order.userAddress),

          OrderDetailsBottomSection(
            items: order.items,
            paymentMethod: order.paymentMethod,
            total: order.total,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withValues(alpha: 0.2),
                width: 2,
                style: BorderStyle.solid,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'EGP ${order.total}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          UpdateOrderButtonWidget(order: order, isUpdating: isUpdating),
        ],
      ),
    );
  }
}
