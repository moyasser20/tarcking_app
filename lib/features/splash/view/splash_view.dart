import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tarcking_app/features/auth/domain/services/auth_services.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToInitial();
  }

  Future<void> _navigateToInitial() async {
    await Future.delayed(const Duration(seconds: 2));

    final route = await _getInitialRoute();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
  }

  Future<String> _getInitialRoute() async {
    final isLoggedIn = await AuthService.isLoggedIn();
    final token = await AuthService.getToken();

    if (isLoggedIn && token != null) {
      return AppRoutes.dashboard;
    } else {
      return AppRoutes.login;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      body: Center(child: SizedBox(height: 350, width: 350, child: SizedBox())),
    );
  }
}
