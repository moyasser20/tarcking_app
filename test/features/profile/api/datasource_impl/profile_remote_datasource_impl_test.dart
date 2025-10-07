import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tarcking_app/core/api/client/api_client.dart';
import 'package:tarcking_app/core/errors/api_result.dart';
import 'package:tarcking_app/features/profile/api/datasource_impl/profile_remote_datasource_impl.dart';
import 'package:tarcking_app/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:tarcking_app/features/profile/data/models/change_password_request_model.dart';
import 'package:tarcking_app/features/profile/data/models/change_password_response_model.dart';
import 'package:tarcking_app/features/profile/data/models/edit_profile_request_model.dart';
import 'package:tarcking_app/features/profile/data/models/edit_profile_response_model.dart';
import 'package:tarcking_app/features/profile/data/models/profile_response.dart';
import 'package:tarcking_app/features/profile/data/models/upload_photo_response.dart';
import 'package:tarcking_app/features/profile/data/models/user_model.dart';

import 'profile_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockProfileApiClient;
  late ProfileRemoteDatasource datasource;

  setUp(() {
    mockProfileApiClient = MockApiClient();
    datasource = ProfileRemoteDatasourceImpl(apiClient: mockProfileApiClient);
  });

  group('ProfileRemoteDatasourceImpl - changePassword', () {
    test(
      'should return ChangePasswordResponseModel when API call is successful',
      () async {
        // arrange
        final request = ChangePasswordRequestModel(
          password: "old123",
          newPassword: "new123",
        );

        final response = ChangePasswordResponseModel(
          message: "Password changed successfully",
          token: "newToken123",
        );

        when(
          mockProfileApiClient.changePassword(request),
        ).thenAnswer((_) async => response);

        // act
        final result = await datasource.changePassword(request);

        // assert
        expect(result, isA<ChangePasswordResponseModel>());
        expect((result.message), "Password changed successfully");
        expect(result.token, "newToken123");
        verify(mockProfileApiClient.changePassword(request)).called(1);
      },
    );

    test('should throw DioException when API call fails', () async {
      final request = ChangePasswordRequestModel(
        password: "old123",
        newPassword: "new123",
      );

      when(mockProfileApiClient.changePassword(request)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/change-password'),
          type: DioExceptionType.badResponse,
        ),
      );

      // Act & Assert
      await expectLater(
        datasource.changePassword(request),
        throwsA(isA<Exception>()),
      );

      verify(mockProfileApiClient.changePassword(request)).called(1);
    });
  });

  group('ProfileRemoteDatasourceImpl - getProfile', () {
    test('should return ApiSuccessResult when API call succeeds', () async {
      // arrange
      final fakeUser = User(
        id: "123",
        firstName: "Mouayed",
        lastName: "Mohamed",
        email: "mouayed@example.com",
        gender: "male",
        phone: "01000000000",
        photo: "https://example.com/photo.jpg",
        role: "customer",
        createdAt: "2025-09-01T00:00:00Z",
      );

      final fakeResponse = ProfileResponse(
        message: "Profile fetched successfully",
        driver: fakeUser,
      );

      when(
        mockProfileApiClient.getProfile(),
      ).thenAnswer((_) async => fakeResponse);

      // act
      final result = await datasource.getProfile();

      // assert
      expect(result, isA<ApiSuccessResult<ProfileResponse>>());
      expect(
        (result as ApiSuccessResult).data.message,
        "Profile fetched successfully",
      );
      verify(mockProfileApiClient.getProfile()).called(1);
    });

    test(
      'should return ApiErrorResult with server message when DioException thrown',
      () async {
        final dioError = DioException(
          requestOptions: RequestOptions(path: '/profile'),
          response: Response(
            requestOptions: RequestOptions(path: '/profile'),
            statusCode: 401,
            data: {'message': 'Unauthorized'},
          ),
          type: DioExceptionType.badResponse,
        );

        when(mockProfileApiClient.getProfile()).thenThrow(dioError);

        // act
        final result = await datasource.getProfile();

        // assert
        expect(result, isA<ApiErrorResult>());
        expect((result as ApiErrorResult).errorMessage, 'Unauthorized');
      },
    );

    test(
      'should return ApiErrorResult with "Unexpected error" on generic exception',
      () async {
        when(
          mockProfileApiClient.getProfile(),
        ).thenThrow(Exception('Something went wrong'));

        // act
        final result = await datasource.getProfile();

        // assert
        expect(result, isA<ApiErrorResult>());
        expect((result as ApiErrorResult).errorMessage, 'Unexpected error');
      },
    );
  });

  group('ProfileRemoteDatasourceImpl - editProfile', () {
    final fakeRequest = EditProfileRequestModel(
      firstName: "John",
      lastName: "Doe",
      email: "john@example.com",
      phone: "01000000000",
    );

    final fakeUser = User(
      id: "123",
      firstName: "Mouayed",
      lastName: "Mohamed",
      email: "mouayed@example.com",
      gender: "male",
      phone: "01000000000",
      photo: "https://example.com/photo.jpg",
      role: "customer",
      createdAt: "2025-09-01T00:00:00Z",
    );

    final fakeResponse = EditProfileResponseModel(
      message: "Profile updated",
      driver: fakeUser,
    );

    test('should return ApiSuccessResult when API call succeeds', () async {
      when(
        mockProfileApiClient.editProfile(fakeRequest),
      ).thenAnswer((_) async => fakeResponse);

      // act
      final result = await datasource.editProfile(fakeRequest);

      // assert
      expect(result, isA<ApiSuccessResult<EditProfileResponseModel>>());
      expect((result as ApiSuccessResult).data.message, "Profile updated");
      verify(mockProfileApiClient.editProfile(fakeRequest)).called(1);
    });

    test('should return ApiErrorResult when API throws exception', () async {
      when(
        mockProfileApiClient.editProfile(fakeRequest),
      ).thenThrow(Exception("Failed to update"));

      // act
      final result = await datasource.editProfile(fakeRequest);

      // assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult).errorMessage,
        contains("Failed to update"),
      );
    });
  });

  group('ProfileRemoteDatasourceImpl - uploadPhoto', () {
    final fakeFile = File('test.jpg');
    final fakeResponse = UploadPhotoResponse(message: "Photo uploaded");

    test('should return ApiSuccessResult when API call succeeds', () async {
      when(
        mockProfileApiClient.uploadPhoto(fakeFile),
      ).thenAnswer((_) async => fakeResponse);

      // act
      final result = await datasource.uploadPhoto(fakeFile);

      // assert
      expect(result, isA<ApiSuccessResult<UploadPhotoResponse>>());
      expect((result as ApiSuccessResult).data.message, "Photo uploaded");
      verify(mockProfileApiClient.uploadPhoto(fakeFile)).called(1);
    });

    test('should return ApiErrorResult when API throws exception', () async {
      when(
        mockProfileApiClient.uploadPhoto(fakeFile),
      ).thenThrow(Exception("Upload failed"));

      // act
      final result = await datasource.uploadPhoto(fakeFile);

      // assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult).errorMessage,
        contains("Upload failed"),
      );
    });
  });
}
