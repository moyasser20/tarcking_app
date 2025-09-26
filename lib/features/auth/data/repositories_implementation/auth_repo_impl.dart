import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/domain/repositories/auth_repo.dart';
import '../../domain/responses/auth_response.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/forget_password_models/forget_password_request.dart';
import '../models/forget_password_models/reset_password_request_model.dart';
import '../models/forget_password_models/verify_code_request_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepoImpl(this._authRemoteDatasource);

  @override
  Future<AuthResponse<String>> forgetPassword(String email) async {
    final model = ForgetPasswordRequestModel(email: email);
    return await _authRemoteDatasource.forgetPassword(model);
  }

  @override
  Future<AuthResponse<String>> verifyCode(String code) async {
    final model = VerifyCodeRequestModel(resetCode: code);
    return await _authRemoteDatasource.verifyResetPassword(model);
  }

  @override
  Future<AuthResponse<String>> resetPassword(
      String email, String newPassword) async {
    final model =
        ResetPasswordRequestModel(email: email, newPassword: newPassword);
    return await _authRemoteDatasource.resetPassword(model);
  }

  // @override
  // Future<AuthResponse<LoginResponse>> login(LoginRequest loginRequest) async {
  //   return await _authRemoteDatasource.login(loginRequest);
  // }
  //
  // @override
  // Future<RegisterResponse> signUp(RegisterRequest registerRequest) {
  //   return _authRemoteDatasource.signUp(registerRequest);
  // }
  //
  // @override
  // Future<String> logout() {
  //   return _authRemoteDatasource.logout();
  // }
}
