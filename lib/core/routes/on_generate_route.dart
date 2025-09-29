import 'package:flutter/material.dart';
import 'package:tarcking_app/core/routes/route_names.dart';
import '../../features/auth/presentation/apply/view/application_approved_screen.dart';
import '../../features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/config/di.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:tarcking_app/features/auth/presentation/login/view/login_screen.dart';
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
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
    case AppRoutes.applicationApproved:
    return MaterialPageRoute(
    builder: (_) => const ApplicationApprovedScreen(),
    );

      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
        );
    }
  }
}
