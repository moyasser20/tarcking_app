import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/features/order_details/data/models/order_details_model.dart';
import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../successpage/presentation/view/success_page.dart';
import '../../cubit/order_details_cubit.dart';
import '../../../../../core/l10n/translation/app_localizations.dart';

class UpdateOrderButtonWidget extends StatelessWidget {
  final OrderDetails order;
  final bool isUpdating;
  final Function(String buttonText)? onButtonClicked;

  const UpdateOrderButtonWidget({
    super.key,
    required this.order,
    required this.isUpdating,
    this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final buttonText = _getButtonText(local, order.state);

    return CustomElevatedButton(
      width: double.infinity,
      text: buttonText,
      onPressed: isUpdating ||
          order.state == 'canceled'
          ? null
          : () {
        onButtonClicked?.call(buttonText);

        // If the order is completed, navigate to SuccessPage
        if (order.state == 'completed') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SuccessPage()),
          );
        } else {
          // Otherwise, update order status normally
          context.read<OrderDetailsCubit>().updateOrderStatus();
        }
      },
    );
  }

  String _getButtonText(AppLocalizations local, String state) {
    switch (state) {
      case 'pending':
        return local.pendingStatus;
      case 'inProgress':
        return local.inProgressStatus;
      case 'canceled':
        return local.cancelledStatus;
      case 'completed':
        return local.completedStatus;
      default:
        return local.updateText;
    }
  }
}
