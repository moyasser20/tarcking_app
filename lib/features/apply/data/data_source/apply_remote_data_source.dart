import 'package:dio/dio.dart';
import 'package:tarcking_app/features/apply/data/models/driver.dart';

abstract class ApplyRemoteDataSource {
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
