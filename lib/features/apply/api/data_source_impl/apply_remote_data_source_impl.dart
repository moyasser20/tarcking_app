import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/apply/api/api_client/apply_api_client.dart';
import 'package:tarcking_app/features/apply/data/data_source/apply_remote_data_source.dart';
import 'package:tarcking_app/features/apply/data/models/driver.dart';

@LazySingleton(as: ApplyRemoteDataSource)
class ApplyRemoteDataSourceImpl implements ApplyRemoteDataSource {
  final ApplyApiClient _apiClient;

  ApplyRemoteDataSourceImpl(this._apiClient);

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
