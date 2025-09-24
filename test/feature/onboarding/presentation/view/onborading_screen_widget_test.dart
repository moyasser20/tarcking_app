import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarcking_app/core/widgets/custom_Elevated_Button.dart';
import 'package:tarcking_app/core/l10n/translation/app_localizations.dart';
import 'package:tarcking_app/features/onboarding/presentation/view/onboarding_screen.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  );
}

void main() {
  group('OnBoardingScreen Widget Tests', () {
    testWidgets('renders delivery image', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(const OnBoardingScreen()));

      expect(find.byType(Image), findsOneWidget);
      expect(find.byWidgetPredicate(
            (widget) => widget is Image && widget.image is AssetImage,
      ), findsOneWidget);
    });

    testWidgets('shows welcome text and app name', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(const OnBoardingScreen()));

      expect(find.textContaining('Welcome'), findsOneWidget);
      expect(find.textContaining('Flowery Rider'), findsOneWidget);
    });

    testWidgets('has two main buttons', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(const OnBoardingScreen()));

      final buttons = find.byType(CustomElevatedButton);
      expect(buttons, findsNWidgets(2));

      expect(find.widgetWithText(CustomElevatedButton, 'Login'), findsOneWidget);
      expect(find.widgetWithText(CustomElevatedButton, 'Apply Now'), findsOneWidget);
    });

    testWidgets('shows version text', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(const OnBoardingScreen()));

      expect(find.byKey(const Key('versionText')), findsOneWidget);
    });

    testWidgets('taps on login button', (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        makeTestableWidget(
          Scaffold(
            body: CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Login'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
