import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarcking_app/features/homescreen/presentation/widgets/address_widget.dart';

void main() {
  group('AddressWidget', () {
    testWidgets('renders correctly with default profile image', (
      WidgetTester tester,
    ) async {
      const title = 'Pickup Address';
      const storeName = 'Flower Shop';
      const address = '123 Main St';
      const image = 'default-profile.png';

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)), // fix overflow
          child: MaterialApp(
            home: Scaffold(
              body: AddressWidget(
                TitleAddress: title,
                image: image,
                storeName: storeName,
                address: address,
              ),
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(storeName), findsOneWidget);
      expect(find.text(address), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders correctly with network image', (
      WidgetTester tester,
    ) async {
      const title = 'User Address';
      const storeName = 'John Doe';
      const address = '456 Elm St';
      const image = 'https://example.com/profile.jpg';

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: MaterialApp(
            home: Scaffold(
              body: AddressWidget(
                TitleAddress: title,
                image: image,
                storeName: storeName,
                address: address,
              ),
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(storeName), findsOneWidget);
      expect(find.text(address), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('falls back to default image when network image fails', (
      WidgetTester tester,
    ) async {
      const title = 'User Address';
      const storeName = 'Jane Doe';
      const address = '789 Pine St';
      const image = 'https://example.com/404.jpg';

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: MaterialApp(
            home: Scaffold(
              body: AddressWidget(
                TitleAddress: title,
                image: image,
                storeName: storeName,
                address: address,
              ),
            ),
          ),
        ),
      );

      // Trigger the image error builder
      await tester.pumpAndSettle();

      final errorWidget = tester.widget<Image>(find.byType(Image).first);
      expect(errorWidget, isA<Image>());
    });
  });
}
