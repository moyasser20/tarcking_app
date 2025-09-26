import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/api/api_client/apply_api_client.dart';
import 'package:tarcking_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:tarcking_app/features/auth/data/models/driver.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApplyApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
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
  }) async {
    final response = await _apiClient.applyDriver(
      country: country,
      firstName: firstName,
      lastName: lastName,
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
      nid: nid,
      nidImg: nidImg,
      email: email,
      password: password,
      rePassword: rePassword,
      gender: gender,
      phone: phone,
    );

    return response.driver;
  }
}
