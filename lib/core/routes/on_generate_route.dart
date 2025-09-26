import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/config/di.dart'; // Import your DI
import 'package:tarcking_app/core/routes/route_names.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/viewmodel/forget_password_viewmodel.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/views/screens/forget_password_screen.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/views/screens/email_verificationScreen.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/views/screens/reset_password_screen.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/viewmodel/verify_code_viewmodel.dart';
import 'package:tarcking_app/features/auth/forget_password/presentation/viewmodel/reset_password_viewmodel.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<ForgetPasswordCubit>(
                create: (context) => getIt<ForgetPasswordCubit>(),
                child: const ForgetPasswordScreen(),
              ),
        );

      case AppRoutes.emailVerification:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<VerifyCodeCubit>(
                create: (context) => getIt<VerifyCodeCubit>(),
                child: EmailVerificationScreen(email: email),
              ),
        );

      case AppRoutes.resetPassword:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<ResetPasswordCubit>(
                create: (context) => getIt<ResetPasswordCubit>(),
                child: ResetPasswordScreen(email: email),
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
