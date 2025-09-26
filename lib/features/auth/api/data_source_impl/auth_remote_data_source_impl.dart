import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';

import '../../../../core/api/client/api_client.dart';
import '../../data/datasource/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _apiClient.login(loginRequest);
  }
}
