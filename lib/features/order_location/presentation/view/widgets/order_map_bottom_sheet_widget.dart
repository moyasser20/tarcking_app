import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/contants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../order_details/data/models/order_details_model.dart';
import '../../../../order_details/presentation/cubit/order_details_cubit.dart';

class OrderMapBottomSheetWidget extends StatelessWidget {
  final OrderDetails order;
  final bool showPickupFirst;
  final Function(String) onCallPressed;
  final Function(String) onWhatsAppPressed;

  const OrderMapBottomSheetWidget({
    super.key,
    required this.order,
    required this.showPickupFirst, required this.onCallPressed, required this.onWhatsAppPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.pink,
              ),
              width: 80,
            ),
            const SizedBox(height: 12),
            if (showPickupFirst) ..._buildPickupFirstLayout(context),
            if (!showPickupFirst) ..._buildUserFirstLayout(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPickupFirstLayout(BuildContext context) {
    return [
      _buildSectionHeader('Pickup Location'),
      const SizedBox(height: 4),
      _buildAddressSection(
        context,
        order.pickupAddress,
        AppIcons.floweryIcon,
      ),
      const SizedBox(height: 16),
      _buildSectionHeader('User address'),
      const SizedBox(height: 4),
      _buildAddressSection(
        context,
        order.userAddress,
          AppIcons.profileIcon
      ),
    ];
  }

  List<Widget> _buildUserFirstLayout(BuildContext context) {
    return [
      _buildSectionHeader('User address'),
      const SizedBox(height: 4),
      _buildAddressSection(
        context,
        order.userAddress,
        AppIcons.profileIcon
      ),
      const SizedBox(height: 16),
      _buildSectionHeader('Pickup Location'),
      const SizedBox(height: 4),
      _buildAddressSection(
        context,
        order.pickupAddress,
        AppIcons.floweryIcon,
      ),
    ];
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSection(
      BuildContext context,
      Address address,
      String icon,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.09),
            blurRadius: 4.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: SvgPicture.asset(icon, width: 24, height: 24),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.locationMarkerIcon,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        address.address,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => onCallPressed(address.phoneNumber),
            child: Icon(
              Icons.local_phone_outlined,
              color: AppColors.pink,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () => onWhatsAppPressed(address.phoneNumber),
            child: SvgPicture.asset(
              AppIcons.whatsappIcon,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}