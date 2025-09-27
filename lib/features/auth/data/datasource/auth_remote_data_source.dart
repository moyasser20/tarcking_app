import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/data/models/driver.dart';

abstract class AuthRemoteDataSource {
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
}
