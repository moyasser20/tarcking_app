import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/icons/arrow_back_icon.png"),
              ),
              const SizedBox(width: 20),
              Text(
                local.orderDetails,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ],
      ).setHorizontalPadding(context, 0.05),
    );
  }
}
