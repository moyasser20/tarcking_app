import 'package:flutter/material.dart';
import 'package:tarcking_app/core/contants/app_icons.dart';
import 'package:tarcking_app/core/contants/app_images.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../homescreen/presentation/widgets/address_widget.dart';


class MyOrderContainerWidget extends StatelessWidget {


  const MyOrderContainerWidget({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context)!;


    return Container(
      width: size.width * 0.9,
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.flowerOrder,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Image.asset(AppIcons.acceptedIcon),
              const SizedBox(width: 6),
              Text(
                "Completed",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 130),
              Text(
                "#123456",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ).setHorizontalPadding(context, 0.02),


          const SizedBox(height: 20),

          AddressWidget(
            titleAddress: local.pickupAddress,
            image: "assets/images/yasser.jpg",
            storeName: "Flowery Store",
            address: "20th st, Sheikh Zayed, Giza",
          ),

          const SizedBox(height: 20),

          AddressWidget(
            titleAddress: local.userAddress,
            image: "assets/images/yasser.jpg",
            storeName: "Flowery Store",
            address: "20th st, Sheikh Zayed, Giza",
          ),
        ],
      ),
    ).setHorizontalPadding(context, 0.015);
  }
}
