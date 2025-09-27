import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarcking_app/core/config/di.dart';
import 'package:tarcking_app/features/auth/domain/usecases/login_usecase/login_usecase.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:tarcking_app/main.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  late MockLoginUsecase mockLoginUsecase;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    getIt.registerSingleton<LoginCubit>(
      LoginCubit(loginUsecase: mockLoginUsecase),
    );
  });

  tearDown(() {
    getIt.unregister<LoginCubit>();
  });

  testWidgets('Renders MyApp and LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(BlocProvider<LoginCubit>), findsOneWidget);
  });
}
