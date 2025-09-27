import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/features/auth/domain/usecases/apply/apply_driver_usecase.dart';
import 'package:tarcking_app/features/auth/presentation/apply/view_model/apply_cubit.dart';
import 'package:tarcking_app/features/auth/presentation/apply/view/apply_screen.dart';
import '../mocks/mocks.dart';

void main() {
  testWidgets('ApplyScreen renders form fields', (tester) async {
    final mockRepo = MockAuthRepo();
    final usecase = ApplyDriverUseCase(mockRepo);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => ApplyCubit(usecase),
          child: const ApplyScreen(),
        ),
      ),
    );

    expect(find.text('Welcome!!'), findsOneWidget);
    expect(find.text('First legal name'), findsOneWidget);
    expect(find.text('Vehicle number'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
