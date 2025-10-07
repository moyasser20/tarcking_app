import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import 'package:tarcking_app/core/theme/app_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String ordersNumber;
  final String icon;
  final String status;
  const OrderStatusWidget({
    super.key,
    required this.ordersNumber,
    required this.icon,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6,),
          Text(ordersNumber, style: TextStyle(
            fontSize: 18,
          ),).setHorizontalPadding(context, 0.025),
          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset(icon),
              const SizedBox(width: 8,),
              Text(status, style: TextStyle(
                fontSize: 16,
                fontFamily: "Inter",

              ),)
            ],
          ).setHorizontalPadding(context, 0.03)

        ],
      ),
    );
  }
}
