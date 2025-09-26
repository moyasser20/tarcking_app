import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/core/api/api_constants/api_end_points.dart';
import 'package:tarcking_app/features/auth/data/models/apply_response.dart';

@lazySingleton
class ApplyApiClient {
  final Dio _dio;

  ApplyApiClient(this._dio);

  Future<ApplyResponse> applyDriver({
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
    final formData = FormData.fromMap({
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'vehicleLicense': vehicleLicense,
      'NID': nid,
      'NIDImg': nidImg,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'gender': gender,
      'phone': phone,
    });

    final response = await _dio.post(ApiEndPoints.apply, data: formData);

    return ApplyResponse.fromJson(response.data);
  }
}
