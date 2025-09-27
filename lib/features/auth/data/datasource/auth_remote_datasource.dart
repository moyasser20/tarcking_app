import '../../domain/responses/auth_response.dart';
import '../models/forget_password_models/forget_password_request.dart';
import '../models/forget_password_models/reset_password_request_model.dart';
import '../models/forget_password_models/verify_code_request_model.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/data/models/driver.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponse<String>> forgetPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  );
  Future<AuthResponse<String>> verifyResetPassword(
    VerifyCodeRequestModel verifyCodeRequestModel,
  );
  Future<AuthResponse<String>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  );
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<Driver> applyDriver({
    required String country,
    required String firstName,
    required String lastName,
    required String vehicleType,
    required String vehicleNumber,
    required MultipartFile vehicleLicense,
    required String nid,
    required MultipartFile nidImg,
    required String email,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  });
  // Future<String> logout();
}
