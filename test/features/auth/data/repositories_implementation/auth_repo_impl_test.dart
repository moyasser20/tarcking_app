import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tarcking_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:tarcking_app/features/auth/data/repositories_implementation/auth_repo_impl.dart';
import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasource])
void main() {
  late MockAuthRemoteDatasource mockDatasource;
  late AuthRepoImpl repo;

  setUp(() {
    mockDatasource = MockAuthRemoteDatasource();
    repo = AuthRepoImpl(mockDatasource);
  });

  group('AuthRepoImpl', () {
    group('forgetPassword', () {
      test('returns success when datasource returns success response',
          () async {
        final successResponse = AuthResponse<String>.success('success');
        when(mockDatasource.forgetPassword(any))
            .thenAnswer((_) async => successResponse);

        final result = await repo.forgetPassword('test@example.com');

        expect(result, isA<AuthResponse<String>>());
        expect(result.data, 'success');
        expect(result.isSuccess, true);

        final captured =
            verify(mockDatasource.forgetPassword(captureAny)).captured.single;
        expect(captured.email, 'test@example.com');
      });

      test('returns error when datasource returns error response', () async {
        final errorResponse = AuthResponse<String>.error('Network error');
        when(mockDatasource.forgetPassword(any))
            .thenAnswer((_) async => errorResponse);

        final result = await repo.forgetPassword('test@example.com');

        expect(result, isA<AuthResponse<String>>());
        expect(result.error, 'Network error');
        expect(result.isSuccess, false);
      });
    });

    group('verifyCode', () {
      test('returns success when datasource returns success response',
          () async {
        final successResponse = AuthResponse<String>.success('verified');
        when(mockDatasource.verifyResetPassword(any))
            .thenAnswer((_) async => successResponse);

        final result = await repo.verifyCode('12345');

        expect(result, isA<AuthResponse<String>>());
        expect(result.data, 'verified');
        expect(result.isSuccess, true);

        final captured = verify(mockDatasource.verifyResetPassword(captureAny))
            .captured
            .single;
        expect(captured.resetCode, '12345');
      });

      test('returns error when datasource returns error response', () async {
        final errorResponse = AuthResponse<String>.error('Invalid code');
        when(mockDatasource.verifyResetPassword(any))
            .thenAnswer((_) async => errorResponse);

        final result = await repo.verifyCode('12345');

        expect(result, isA<AuthResponse<String>>());
        expect(result.error, 'Invalid code');
        expect(result.isSuccess, false);
      });
    });

    group('resetPassword', () {
      test('returns success when datasource returns success response',
          () async {
        final successResponse = AuthResponse<String>.success('reset done');
        when(mockDatasource.resetPassword(any))
            .thenAnswer((_) async => successResponse);

        final result = await repo.resetPassword(
          'test@example.com',
          'newPass123',
        );

        expect(result, isA<AuthResponse<String>>());
        expect(result.data, 'reset done');
        expect(result.isSuccess, true);

        final captured =
            verify(mockDatasource.resetPassword(captureAny)).captured.single;
        expect(captured.email, 'test@example.com');
        expect(captured.newPassword, 'newPass123');
      });

      test('returns error when datasource returns error response', () async {
        final errorResponse =
            AuthResponse<String>.error('Password reset failed');
        when(mockDatasource.resetPassword(any))
            .thenAnswer((_) async => errorResponse);

        final result =
            await repo.resetPassword('test@example.com', 'newPass123');

        expect(result, isA<AuthResponse<String>>());
        expect(result.error, 'Password reset failed');
        expect(result.isSuccess, false);
      });
    });
  });


}
