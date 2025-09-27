import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';
import '../../data/models/login/login_request.dart';
import '../../data/models/login/login_response.dart';
import '../entities/driver_entity.dart';
import '../entities/vehicles_entity.dart';

abstract class AuthRepo {
  Future<AuthResponse<String>> forgetPassword(String email);
  Future<AuthResponse<String>> verifyCode(String code);
  Future<AuthResponse<String>> resetPassword(String email, String newPassword);
  Future<LoginResponse> login(LoginRequest loginRequest);
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
  });
  Future<List<VehicleEntity>> getVehicles();

// Future<String> logout();
}
