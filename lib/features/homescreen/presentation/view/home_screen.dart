import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import 'package:tarcking_app/core/theme/app_colors.dart';

import '../../../../core/contants/app_images.dart';
import '../widgets/order_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Image.asset(AppImages.floweryRider),
            const SizedBox(height: 40),
            OrderContainerWidget(),
            const SizedBox(height: 30),
            OrderContainerWidget(),
            const SizedBox(height: 30),
            OrderContainerWidget(),
            const SizedBox(height: 50),
          ],
        ).setHorizontalPadding(context, 0.04),
      ),
    );
  }
}
