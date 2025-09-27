import 'package:injectable/injectable.dart';

import '../../../../core/api/client/api_client.dart';
import '../../data/datasource/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);
}
