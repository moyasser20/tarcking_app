import 'package:flutter/material.dart';
import 'package:tarcking_app/core/routes/route_names.dart';
import '../../features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/config/di.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:tarcking_app/features/auth/presentation/login/view/login_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      case AppRoutes.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

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
