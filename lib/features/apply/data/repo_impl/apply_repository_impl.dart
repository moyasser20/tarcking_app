import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/apply/data/data_source/apply_remote_data_source.dart';
import 'package:tarcking_app/features/apply/domain/entities/driver_entity.dart';
import 'package:tarcking_app/features/apply/domain/repo/apply_repository.dart';

@LazySingleton(as: ApplyRepository)
class ApplyRepositoryImpl implements ApplyRepository {
  final ApplyRemoteDataSource _remoteDataSource;

  ApplyRepositoryImpl(this._remoteDataSource);

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
    final driver = await _remoteDataSource.applyDriver(
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
}
