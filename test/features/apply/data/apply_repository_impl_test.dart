import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/apply/data/data_source/apply_remote_data_source.dart';
import 'package:tarcking_app/features/apply/data/models/driver.dart' as model;
import 'package:tarcking_app/features/apply/data/repo_impl/apply_repository_impl.dart';
import 'dart:io';

class _MockRemote extends Mock implements ApplyRemoteDataSource {}

void main() {
  late _MockRemote remote;
  late ApplyRepositoryImpl repo;

  setUpAll(() {
    registerFallbackValue(MultipartFile.fromString('file'));
  });

  setUp(() {
    remote = _MockRemote();
    repo = ApplyRepositoryImpl(remote);
  });

  test('maps Driver model to DriverEntity correctly', () async {
    // Create temp files to satisfy MultipartFile.fromFile
    final tmpDir = Directory.systemTemp.createTempSync();
    final licPath = File('${tmpDir.path}/lic.png')..writeAsStringSync('x');
    final idPath = File('${tmpDir.path}/id.png')..writeAsStringSync('x');
    when(
      () => remote.applyDriver(
        country: any(named: 'country'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        vehicleType: any(named: 'vehicleType'),
        vehicleNumber: any(named: 'vehicleNumber'),
        vehicleLicense: any(named: 'vehicleLicense'),
        nid: any(named: 'nid'),
        nidImg: any(named: 'nidImg'),
        email: any(named: 'email'),
        password: any(named: 'password'),
        rePassword: any(named: 'rePassword'),
        gender: any(named: 'gender'),
        phone: any(named: 'phone'),
      ),
    ).thenAnswer(
      (_) async => model.Driver(
        country: 'Egypt',
        firstName: 'A',
        lastName: 'B',
        vehicleType: 'Car',
        vehicleNumber: '123',
        vehicleLicense: 'lic.png',
        nid: '123',
        nidImg: 'id.png',
        email: 'a@b.com',
        gender: 'Male',
        phone: '01000000000',
        photo: '',
        role: 'driver',
        id: '1',
        createdAt: 'now',
      ),
    );

    final entity = await repo.applyDriver(
      country: 'Egypt',
      firstName: 'A',
      lastName: 'B',
      vehicleType: 'Car',
      vehicleNumber: '123',
      vehicleLicensePath: licPath.path,
      nid: '123',
      nidImgPath: idPath.path,
      email: 'a@b.com',
      password: 'password!1',
      rePassword: 'password!1',
      gender: 'Male',
      phone: '01000000000',
    );

    expect(entity.id, '1');
    expect(entity.firstName, 'A');
    expect(entity.lastName, 'B');
    expect(entity.email, 'a@b.com');
    expect(entity.vehicleNumber, '123');
  });
}
