import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/client/api_client.dart';
import '../../../../core/errors/api_result.dart';
import '../../data/datasource/profile_remote_datasource.dart';
import '../../data/models/change_password_request_model.dart';
import '../../data/models/change_password_response_model.dart';
import '../../data/models/edit_profile_request_model.dart';
import '../../data/models/edit_profile_response_model.dart';
import '../../data/models/profile_response.dart';
import '../../data/models/upload_photo_response.dart';


@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final ApiClient _profileApiClient;

  ProfileRemoteDatasourceImpl({required ApiClient apiClient})
      : _profileApiClient = apiClient;

  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _profileApiClient.getProfile();
      return ApiSuccessResult(response);
    } on DioException catch (e) {
      return ApiErrorResult(e.response?.data['message'] ?? 'Server error');
    } catch (_) {
      return ApiErrorResult('Unexpected error');
    }
  }

  @override
  Future<ChangePasswordResponseModel> changePassword(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      final response =
      await _profileApiClient.changePassword(changePasswordRequestModel);
      return response;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<ApiResult<EditProfileResponseModel>> editProfile(
      EditProfileRequestModel model) async {
    try {
      final response = await _profileApiClient.editProfile(model);
      return ApiSuccessResult(response);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<UploadPhotoResponse>> uploadPhoto(File photo) async {
    try {
      final response = await _profileApiClient.uploadPhoto(photo);
      return ApiSuccessResult(response);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
