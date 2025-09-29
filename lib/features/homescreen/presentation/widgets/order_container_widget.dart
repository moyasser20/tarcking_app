import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';

import '../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import 'address_widget.dart';

class OrderContainerWidget extends StatelessWidget {
  const OrderContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.43,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Text(
            local.flowerOrder,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontFamily: "Inter",
            ),
          ),
          const SizedBox(height: 15),
          AddressWidget(
            TitleAddress: local.pickupAddress,
            image: 'assets/images/flowery_logo.png',
            storeName: local.floweryStore,
            address: local.sampleAddress,
          ),
          const SizedBox(height: 25),
          AddressWidget(
            TitleAddress: local.userAddress,
            image: 'assets/images/user_image.png',
            storeName: local.userNameSample,
            address: local.sampleAddress,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Text(
                local.orderPrice,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(width: 10),
              CustomElevatedButton(
                text: local.reject,
                onPressed: () {},
                width: size.width * 0.27,
                height: size.height * 0.05,
                color: AppColors.white,
                textColor: AppColors.pink,
                borderColor: AppColors.pink,
              ),
              const SizedBox(width: 5),
              CustomElevatedButton(
                text: local.accept,
                onPressed: () {},
                width: size.width * 0.27,
                height: size.height * 0.05,
                color: AppColors.pink,
                textColor: AppColors.white,
              ),
            ],
          ),
        ],
      ).setHorizontalPadding(context, 0.05),
    ).setHorizontalPadding(context, 0.015);
  }
}
