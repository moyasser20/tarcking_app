import 'package:flutter/material.dart';
import 'core/config/di.dart';
import 'core/contants/secure_storage.dart';
import 'core/l10n/translation/app_localizations.dart';
import 'core/routes/on_generate_route.dart';
import 'core/routes/route_names.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/domain/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SecureStorage.initialize();
  final initialRoute = await _getInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
}

Future<String> _getInitialRoute() async {
  final isLoggedIn = await AuthService.isUserAuthenticated();
  if (isLoggedIn) {
    return AppRoutes.dashboard;
  } else {
    AuthService.logout();
    return AppRoutes.login;
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: Routes.onGenerateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      theme: AppTheme.lightTheme,
    );
  }
}
