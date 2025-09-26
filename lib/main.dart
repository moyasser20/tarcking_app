import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/l10n/translation/app_localizations.dart'; // Add this import
import 'package:tarcking_app/core/routes/on_generate_route.dart';
import 'package:tarcking_app/core/routes/route_names.dart';
import 'core/config/di.dart';
import 'core/contants/secure_storage.dart';
import 'features/localization/data/localization_preference.dart';
import 'features/localization/localization_controller/localization_cubit.dart';
import 'features/localization/localization_controller/localization_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SecureStorage.initialize();
  String languageValue = await LocalizationPreference.getLanguage();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create:
              (BuildContext context) =>
                  LocalizationCubit(language: languageValue),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        final cubit = context.read<LocalizationCubit>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tracking App',
          initialRoute: AppRoutes.initial,
          onGenerateRoute: Routes.onGenerateRoute,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale:
              cubit.language == "en" ? const Locale("en") : const Locale("ar"),
        );
      },
    );
  }
}
