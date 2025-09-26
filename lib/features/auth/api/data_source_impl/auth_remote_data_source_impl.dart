import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';
import 'dart:convert';

import '../../../../core/api/client/api_client.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/forget_password_models/forget_password_request.dart';
import '../../data/models/forget_password_models/reset_password_request_model.dart';
import '../../data/models/forget_password_models/verify_code_request_model.dart';

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient _authApiClient;

  AuthRemoteDatasourceImpl(this._authApiClient);

  String _extractApiMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map) {
      return data['error'] ??
          data['message'] ??
          ServerFailure.fromDio(e).errorMessage;
    }
    if (data is String) {
      try {
        final decoded = json.decode(data);
        if (decoded is Map) {
          return decoded['error'] ??
              decoded['message'] ??
              ServerFailure.fromDio(e).errorMessage;
        }
      } catch (_) {}
    }
    return ServerFailure.fromDio(e).errorMessage;
  }

  @override
  Future<AuthResponse<String>> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    try {
      final result =
      await _authApiClient.forgetPassword(forgetPasswordRequestModel);
      return AuthResponse.success(result);
    } on DioException catch (e) {
      String apiMessage = _extractApiMessage(e);
      return AuthResponse.error(apiMessage);
    } catch (e) {
      return AuthResponse.error(e.toString());
    }
  }

  @override
  Future<AuthResponse<String>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    try {
      final result =
      await _authApiClient.resetPassword(resetPasswordRequestModel);
      return AuthResponse.success(result);
    } on DioException catch (e) {
      String apiMessage = _extractApiMessage(e);
      return AuthResponse.error(apiMessage);
    } catch (e) {
      return AuthResponse.error(e.toString());
    }
  }

  @override
  Future<AuthResponse<String>> verifyResetPassword(
      VerifyCodeRequestModel verifyCodeRequestModel) async {
    try {
      final result =
      await _authApiClient.verifyResetCode(verifyCodeRequestModel);
      return AuthResponse.success(result);
    } on DioException catch (e) {
      String apiMessage = _extractApiMessage(e);
      return AuthResponse.error(apiMessage);
    } catch (e) {
      return AuthResponse.error(e.toString());
    }
  }
  //
  // @override
  // Future<AuthResponse<LoginResponse>> login(LoginRequest loginRequest) async {
  //   try {
  //     final result = await _authApiClient.login(loginRequest);
  //     return AuthResponse.success(result);
  //   } on DioException catch (e) {
  //     String apiMessage = _extractApiMessage(e);
  //     return AuthResponse.error(apiMessage);
  //   } catch (e) {
  //     return AuthResponse.error(e.toString());
  //   }
  // }
  //
  // @override
  // Future<RegisterResponse> signUp(RegisterRequest registerRequest) {
  //   try {
  //     return _authApiClient.signUp(registerRequest);
  //   } catch (e) {
  //     throw ("Error: ${e.toString()}");
  //   }
  // }
  //
  // @override
  // Future<String> logout() async {
  //   return await _authApiClient.logout();
  // }
}
