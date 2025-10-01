import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';

import '../../../../core/theme/app_colors.dart';

class AddressWidget extends StatelessWidget {
  final String TitleAddress;
  final String image;
  final String storeName;
  final String address;

  const AddressWidget({
    super.key,
    required this.TitleAddress,
    required this.image,
    required this.storeName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TitleAddress,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.grey,
            fontFamily: "Inter",
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: size.width * 0.95,
          height: size.height * 0.082,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    image == "default-profile.png"
                        ? Image.asset(
                          "assets/images/empty_profile_image.jpg",
                          width: size.width * 0.15,
                          height: size.height * 0.08,
                          fit: BoxFit.cover,
                        )
                        : Image.network(
                          image,
                          width: size.width * 0.15,
                          height: size.height * 0.08,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/empty_profile_image.jpg",
                              width: size.width * 0.15,
                              height: size.height * 0.08,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.grey,
                      fontFamily: "Inter",
                    ),
                  ).setHorizontalPadding(context, 0.001),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 5),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).setHorizontalPadding(context, 0.01);
  }
}
