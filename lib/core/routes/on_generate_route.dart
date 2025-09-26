
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarcking_app/core/routes/route_names.dart';

import '../../features/dashboard/presentation/views/dashboard_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
