import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:tarcking_app/features/auth/domain/entities/apply_entites/driver_entity.dart';
import 'package:tarcking_app/features/auth/domain/repo/auth_repo.dart';
import '../../domain/entities/apply_entites/vehicle_enitity.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;
  AuthRepoImpl(this._authRemoteDatasource);

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
    final driver = await _authRemoteDatasource.applyDriver(
      country: country,
      firstName: firstName,
      lastName: lastName,
      vehicleType: vehicleType,
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

  @override
  Future<List<VehicleEntity>> getVehicles() async {
    final response = await _authRemoteDatasource.getVehicles();

    return response.vehicles!.map((v) {
      return VehicleEntity(
        id: v.Id ?? '',
        type: v.type ?? '',
        image: v.image ?? '',
        createdAt: v.createdAt ?? '',
        updatedAt: v.updatedAt ?? '',
      );
    }).toList();
  }
}
