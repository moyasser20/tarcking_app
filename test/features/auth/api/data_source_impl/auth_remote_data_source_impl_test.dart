import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/core/api/client/api_client.dart';
import 'package:tarcking_app/features/auth/api/data_source_impl/auth_remote_data_source_impl.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = AuthRemoteDataSourceImpl(mockApiClient);
  });

  final loginRequest = LoginRequest(
    email: "test@example.com",
    password: "123456",
  );

  group("AuthRemoteDataSourceImpl.login", () {
    test(
      "should return AuthResponse.success when API call is successful",
      () async {
        final loginResponse = LoginResponse(token: "valid_token");
        when(
          () => mockApiClient.login(loginRequest),
        ).thenAnswer((_) async => loginResponse);

        final result = await dataSource.login(loginRequest);

        expect(result.isSuccess, true);
        expect(result.data, isA<LoginResponse>());
        expect(result.data!.token, equals("valid_token"));
        verify(() => mockApiClient.login(loginRequest)).called(1);
      },
    );

    test(
      "should return AuthResponse.error when DioException occurs with API message",
      () async {
        final dioError = DioException(
          requestOptions: RequestOptions(path: "/login"),
          response: Response(
            requestOptions: RequestOptions(path: "/login"),
            statusCode: 400,
            data: {"message": "Invalid credentials"},
          ),
        );

        when(() => mockApiClient.login(loginRequest)).thenThrow(dioError);

        final result = await dataSource.login(loginRequest);

        expect(result.isSuccess, false);
        expect(result.error, equals("Invalid credentials"));
        verify(() => mockApiClient.login(loginRequest)).called(1);
      },
    );

    test(
      "should return AuthResponse.error when unexpected error occurs",
      () async {
        when(
          () => mockApiClient.login(loginRequest),
        ).thenThrow(Exception("Unexpected error"));

        final result = await dataSource.login(loginRequest);

        expect(result.isSuccess, false);
        expect(result.error, contains("Unexpected error"));
        verify(() => mockApiClient.login(loginRequest)).called(1);
      },
    );
  });
}
