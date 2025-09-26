import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse<String>> forgetPassword(String email);
  Future<AuthResponse<String>> verifyCode(String code);
  Future<AuthResponse<String>> resetPassword(String email, String newPassword);
  // Future<AuthResponse<LoginResponse>> login(LoginRequest loginRequest);
  // Future<RegisterResponse> signUp(@Body() RegisterRequest registerRequest);
  // Future<String> logout();
}
