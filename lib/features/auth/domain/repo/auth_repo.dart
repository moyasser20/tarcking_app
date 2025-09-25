import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';

abstract class AuthRepo {
  Future<LoginResponse> login(LoginRequest loginRequest);
}
