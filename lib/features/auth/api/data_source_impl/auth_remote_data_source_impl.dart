import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import '../../../../core/errors/failure.dart';
import '../../data/datasource/auth_remote_data_source.dart';
import '../../data/models/apply_models/driver.dart';
import '../../data/models/apply_models/vehicles_response.dart';
import '../api_client/apply_api_client.dart';

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApplyApiClient _apiClient;
  AuthRemoteDatasourceImpl(this._apiClient);

  String _extractApiMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map) {
      return data['error'] ??
          data['message'] ??
          ServerFailure.fromDio(e).errorMessage;
    }
    if (data is String) {
      try {
        final decoded = json.decode(data);
        if (decoded is Map) {
          return decoded['error'] ??
              decoded['message'] ??
              ServerFailure.fromDio(e).errorMessage;
        }
      } catch (_) {}
    }
    return ServerFailure.fromDio(e).errorMessage;
  }

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
    try {
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
    } on DioException catch (e) {
      throw Exception(_extractApiMessage(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<VehiclesResponse> getVehicles() async {
    try {
      final response = await _apiClient.getVehicles();
      return response;
    } on DioException catch (e) {
      throw Exception(_extractApiMessage(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
