import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/domain/repositories/auth_repo.dart';
import '../../domain/responses/auth_response.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/forget_password_models/forget_password_request.dart';
import '../models/forget_password_models/reset_password_request_model.dart';
import '../models/forget_password_models/verify_code_request_model.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/domain/entities/driver_entity.dart';

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
    String email,
    String newPassword,
  ) async {
    final model = ResetPasswordRequestModel(
      email: email,
      newPassword: newPassword,
    );
    return await _authRemoteDatasource.resetPassword(model);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _authRemoteDatasource.login(loginRequest);
  }

  String _toHex(String input) {
    return input.codeUnits
        .map((unit) => unit.toRadixString(16).toUpperCase())
        .join();
  }


  @override
  Future<DriverEntity> applyDriver({
    required String country,
    required String firstName,
    required String lastName,
    required String vehicleType,
    required String vehicleNumber,
    required String vehicleLicensePath,
    required String nid,
    required String nidImgPath,
    required String email,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  }) async {
    final hexVehicleType = _toHex(vehicleType);
    final driver = await _authRemoteDatasource.applyDriver(
      country: country,
      firstName: firstName,
      lastName: lastName,
      vehicleType: hexVehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: await MultipartFile.fromFile(vehicleLicensePath),
      nid: nid,
      nidImg: await MultipartFile.fromFile(nidImgPath),
      email: email,
      password: password,
      rePassword: rePassword,
      gender: gender,
      phone: phone,
    );

    return DriverEntity(
      id: driver.id,
      firstName: driver.firstName,
      lastName: driver.lastName,
      email: driver.email,
      phone: driver.phone,
      country: driver.country,
      vehicleType: driver.vehicleType,
      vehicleNumber: driver.vehicleNumber,
    );
  }

  //
  // @override
  // Future<String> logout() {
  //   return _authRemoteDatasource.logout();
  // }
}
