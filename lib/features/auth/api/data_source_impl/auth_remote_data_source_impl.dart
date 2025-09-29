import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/core/errors/failure.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';
import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';
import '../../../../core/api/client/api_client.dart';
import '../../data/datasource/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);
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
  Future<AuthResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiClient.login(loginRequest);
      return AuthResponse.success(response);
    } on DioException catch (e) {
      String apiMessage = _extractApiMessage(e);
      return AuthResponse.error(apiMessage);
    } catch (e) {
      return AuthResponse.error(e.toString());
    }
  }
}
