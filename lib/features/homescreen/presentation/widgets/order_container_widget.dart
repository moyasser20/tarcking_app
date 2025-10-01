import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';

import '../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../core/common/widgets/custom_snackbar_widget.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/order_entity.dart';
import '../viewmodel/home_cubit.dart';
import 'address_widget.dart';

class OrderContainerWidget extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderContainerWidget({super.key, required this.orderEntity});

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

          // Store info
          AddressWidget(
            TitleAddress: local.pickupAddress,
            image: orderEntity.store.image,
            storeName: orderEntity.store.name,
            address: orderEntity.store.address,
          ),

          const SizedBox(height: 25),
          AddressWidget(
            TitleAddress: local.userAddress,
            image: orderEntity.user.photo,
            storeName:
                "${orderEntity.user.firstName} ${orderEntity.user.lastName}",
            address: "20th st, Sheikh Zayed, Giza ", //orderEntity.user.email,
          ),

          const SizedBox(height: 25),
          Row(
            children: [
              Text(
                "${orderEntity.totalPrice}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: local.reject,
                onPressed: () {
                  context.read<HomeCubit>().rejectOrderLocally(
                    orderEntity.wrapperId,
                  );
                  showCustomSnackBar(
                    context,
                    local.orderRejectedSuccessfully,
                    isError: false,
                  );
                },
                width: size.width * 0.27,
                height: size.height * 0.05,
                color: AppColors.white,
                textColor: AppColors.pink,
                borderColor: AppColors.pink,
              ),
              const SizedBox(width: 5),
              CustomElevatedButton(
                text: local.accept,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.orderDetails);
                },
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
