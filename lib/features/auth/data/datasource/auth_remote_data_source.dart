import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';
import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse<LoginResponse>> login(LoginRequest loginRequest);
}
