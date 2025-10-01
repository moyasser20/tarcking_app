import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_states.dart';
import 'package:tarcking_app/features/auth/presentation/login/view/login_screen.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();

    // Proper setup for all required properties
    when(
      () => mockLoginCubit.emailController,
    ).thenReturn(TextEditingController());
    when(
      () => mockLoginCubit.passwordController,
    ).thenReturn(TextEditingController());
    when(() => mockLoginCubit.rememberMe).thenReturn(false);
    when(() => mockLoginCubit.toggleRememberMe(any())).thenReturn(null);
    when(
      () => mockLoginCubit.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );

    // Stream setup
    when(
      () => mockLoginCubit.stream,
    ).thenAnswer((_) => Stream<LoginStates>.empty());
  });

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<LoginCubit>.value(
        value: mockLoginCubit,
        child: const LoginScreen(),
      ),
    );
  }

  testWidgets('shows loading indicator when state is LoginLoadingState', (
    WidgetTester tester,
  ) async {
    // Set the state to loading
    when(() => mockLoginCubit.state).thenReturn(LoginLoadingState());

    await tester.pumpWidget(makeTestableWidget());

    // The CircularProgressIndicator should be found in the CustomElevatedButton when loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('initial state shows form correctly', (
    WidgetTester tester,
  ) async {
    when(() => mockLoginCubit.state).thenReturn(LoginInitialState());

    await tester.pumpWidget(makeTestableWidget());

    expect(find.text("Login"), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
