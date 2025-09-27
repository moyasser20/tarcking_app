import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_states.dart';
import 'package:tarcking_app/features/auth/presentation/login/view/login_screen.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
  setUpAll(() {
    registerFallbackValue(LoginInitialState());
  });

  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();

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
    when(() => mockLoginCubit.state).thenReturn(LoginLoadingState());
    when(
      () => mockLoginCubit.emailController,
    ).thenReturn(TextEditingController());
    when(
      () => mockLoginCubit.passwordController,
    ).thenReturn(TextEditingController());
    when(() => mockLoginCubit.rememberMe).thenReturn(false);

    await tester.pumpWidget(makeTestableWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
