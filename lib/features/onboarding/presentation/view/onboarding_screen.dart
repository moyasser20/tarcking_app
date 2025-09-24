import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import 'package:tarcking_app/core/theme/app_colors.dart';
import 'package:tarcking_app/core/widgets/custom_Elevated_Button.dart';

import '../../../../core/l10n/translation/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset("assets/images/delivery_image.png"),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                local.welcomeTo,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontFamily: "Inter",
                ),
              ),
            ).setHorizontalPadding(context, 0.045),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                local.floweryRiderApp,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontFamily: "Inter",
                ),
              ),
            ).setHorizontalPadding(context, 0.045),
            const SizedBox(height: 20),
            CustomElevatedButton(text: local.login, onPressed: () {}),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: local.applyNow,
              borderColor: AppColors.grey.withOpacity(0.5),
              onPressed: () {},
              color: AppColors.white,
              textColor: AppColors.grey.withOpacity(0.8),
            ),
            const SizedBox(height: 200),
            Text(
              local.versionText,
              key: const Key('versionText'),
              style: const TextStyle(color: AppColors.grey),
            )

          ],
        ),
      ),
    );
  }
}
