import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/apply/domain/entities/driver_entity.dart';
import 'package:tarcking_app/features/apply/domain/use_cases/apply_driver_usecase.dart';
import 'package:tarcking_app/features/apply/presentation/view/apply_screen.dart';
import 'package:tarcking_app/features/apply/presentation/view_model/apply_cubit.dart';

class _MockApplyDriverUseCase extends Mock implements ApplyDriverUseCase {}

void main() {
  final getIt = GetIt.instance;
  late _MockApplyDriverUseCase mockUseCase;

  setUp(() {
    mockUseCase = _MockApplyDriverUseCase();
    if (getIt.isRegistered<ApplyCubit>()) {
      getIt.unregister<ApplyCubit>();
    }
    getIt.registerFactory<ApplyCubit>(() => ApplyCubit(mockUseCase));
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpApplyScreen(WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ApplyScreen()));
    await tester.pumpAndSettle();
  }

  testWidgets('renders apply screen essentials', (tester) async {
    when(
      () => mockUseCase(
        country: any(named: 'country'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        vehicleType: any(named: 'vehicleType'),
        vehicleNumber: any(named: 'vehicleNumber'),
        vehicleLicensePath: any(named: 'vehicleLicensePath'),
        nid: any(named: 'nid'),
        nidImgPath: any(named: 'nidImgPath'),
        email: any(named: 'email'),
        password: any(named: 'password'),
        rePassword: any(named: 'rePassword'),
        gender: any(named: 'gender'),
        phone: any(named: 'phone'),
      ),
    ).thenAnswer(
      (_) async => DriverEntity(
        id: '1',
        firstName: 'A',
        lastName: 'B',
        email: 'a@b.com',
        phone: '01000000000',
        country: 'Egypt',
        vehicleType: 'Car',
        vehicleNumber: '123',
      ),
    );

    await pumpApplyScreen(tester);

    expect(find.text('Apply'), findsOneWidget);
    expect(find.text('Welcome!!'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('shows validation errors when submitting empty form', (
    tester,
  ) async {
    when(
      () => mockUseCase(
        country: any(named: 'country'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        vehicleType: any(named: 'vehicleType'),
        vehicleNumber: any(named: 'vehicleNumber'),
        vehicleLicensePath: any(named: 'vehicleLicensePath'),
        nid: any(named: 'nid'),
        nidImgPath: any(named: 'nidImgPath'),
        email: any(named: 'email'),
        password: any(named: 'password'),
        rePassword: any(named: 'rePassword'),
        gender: any(named: 'gender'),
        phone: any(named: 'phone'),
      ),
    ).thenAnswer(
      (_) async => DriverEntity(
        id: '1',
        firstName: 'A',
        lastName: 'B',
        email: 'a@b.com',
        phone: '01000000000',
        country: 'Egypt',
        vehicleType: 'Car',
        vehicleNumber: '123',
      ),
    );

    await pumpApplyScreen(tester);

    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.text('First name is required'), findsOneWidget);
    expect(find.text('Second name is required'), findsOneWidget);
    expect(find.text('Vehicle number is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Phone is required'), findsOneWidget);
    expect(find.text('ID number is required'), findsOneWidget);
    expect(find.text('Vehicle license image is required'), findsOneWidget);
    expect(find.text('ID image is required'), findsOneWidget);
  });

  testWidgets('submits when valid and shows success snackbar', (tester) async {
    when(
      () => mockUseCase(
        country: any(named: 'country'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        vehicleType: any(named: 'vehicleType'),
        vehicleNumber: any(named: 'vehicleNumber'),
        vehicleLicensePath: any(named: 'vehicleLicensePath'),
        nid: any(named: 'nid'),
        nidImgPath: any(named: 'nidImgPath'),
        email: any(named: 'email'),
        password: any(named: 'password'),
        rePassword: any(named: 'rePassword'),
        gender: any(named: 'gender'),
        phone: any(named: 'phone'),
      ),
    ).thenAnswer(
      (_) async => DriverEntity(
        id: '1',
        firstName: 'A',
        lastName: 'B',
        email: 'a@b.com',
        phone: '01000000000',
        country: 'Egypt',
        vehicleType: 'Car',
        vehicleNumber: '123',
      ),
    );

    await pumpApplyScreen(tester);

    // Fill fields
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter first legal name'),
      'A',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter second legal name'),
      'B',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter vehicle number'),
      '123',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your email'),
      'a@b.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter phone number'),
      '01000000000',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter national ID number'),
      '123456',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter password'),
      'password!1',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Confirm password'),
      'password!1',
    );

    // Set file paths via cubit
    final provider = find.byType(ApplyScreen);
    expect(provider, findsOneWidget);
    final element = tester.element(find.byType(Scaffold));
    final cubit = BlocProvider.of<ApplyCubit>(element);
    cubit.setVehicleLicensePath('/tmp/lic.png');
    cubit.setNidImagePath('/tmp/id.png');

    await tester.tap(find.text('Continue'));
    await tester.pump();

    // After success, snackbar should appear
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
