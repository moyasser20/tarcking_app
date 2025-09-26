import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarcking_app/core/widgets/custom_Elevated_Button.dart';
import 'package:tarcking_app/core/l10n/translation/app_localizations.dart';
import 'package:tarcking_app/features/auth/presentation/apply/view/application_approved_screen.dart';

void main() {
  testWidgets('ApplicationApprovedScreen renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ApplicationApprovedScreen(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Your application has been\n submitted!"), findsOneWidget);
    expect(
      find.textContaining(
        "Thank you for providing your application,\n we will review your application and will get back to you soon.",
      ),
      findsOneWidget,
    );

    expect(find.byType(CustomElevatedButton), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
  });
}
