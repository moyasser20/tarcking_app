import 'package:flutter/material.dart';
import 'package:tarcking_app/core/routes/route_names.dart';
import '../../features/auth/presentation/apply/view/application_approved_screen.dart';
import '../../features/onboarding/presentation/view/onboarding_screen.dart';
class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.applicationApproved:
        {
          return MaterialPageRoute(
            builder: (context) => const ApplicationApprovedScreen(),
            settings: settings,
          );
        }
=======
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }
}
