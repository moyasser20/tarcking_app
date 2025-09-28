import 'package:dio/dio.dart';
import '../models/apply_models/driver.dart';
import '../models/apply_models/vehicles_response.dart';
abstract class AuthRemoteDatasource {

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

  Future<VehiclesResponse> getVehicles();
// Future<String> logout();
}