import 'package:flutter/material.dart';
import 'package:tarcking_app/core/routes/route_names.dart';
import '../../features/auth/presentation/apply/view/application_approved_screen.dart';

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
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
