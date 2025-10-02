import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/driver.dart';
import 'package:tarcking_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:tarcking_app/features/auth/domain/entities/apply_entites/driver_entity.dart';
import '../../mocks/mocks.dart';

void main() {
  late MockAuthRemoteDataSource remote;
  late AuthRepoImpl repo;

  setUpAll(() {
    registerFallbackValue(MultipartFile.fromString(''));
  });

  setUp(() {
    remote = MockAuthRemoteDataSource();
    repo = AuthRepoImpl(remote);
  });

  group('AuthRepoImpl', () {
    group('applyDriver', () {
      test('should return DriverEntity when successful', () async {
        // Arrange
        final driver = Driver(
          id: "507f1f77bcf86cd799439011",
          firstName: "Ahmed",
          lastName: "Naser",
          email: "ahmed@example.com",
          phone: "0100000000",
          country: "Egypt",
          vehicleType: "Car",
          vehicleNumber: "ABC123",
          vehicleLicense: 'license.png',
          nid: '12345678901234',
          nidImg: 'nid.png',
          gender: 'Male',
          photo: '',
          role: 'driver',
          createdAt: '2024-01-01T00:00:00.000Z',
        );

        final mockLicense = MultipartFile.fromString('license');
        final mockNidImg = MultipartFile.fromString('nid');

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
        ).thenAnswer((_) async => driver);

        // Act
        final result = await repo.applyDriver(
          country: "Egypt",
          firstName: "Ahmed",
          lastName: "Naser",
          vehicleType: "Car",
          vehicleNumber: "ABC123",
          vehicleLicensePath: "fake_license.png",
          nid: "12345678901234",
          nidImgPath: "fake_nid.png",
          email: "ahmed@example.com",
          password: "SecurePassword123!",
          rePassword: "SecurePassword123!",
          gender: "Male",
          phone: "0100000000",
        );

        // Assert
        expect(result, isA<DriverEntity>());
        expect(result.id, "507f1f77bcf86cd799439011");
        expect(result.firstName, "Ahmed");
        expect(result.lastName, "Naser");
      });

      setUp(() async {
        final licenseFile = File('test/files/fake_license.png');
        final nidFile = File('test/files/fake_nid.png');
        await licenseFile.create(recursive: true);
        await nidFile.create(recursive: true);
        await licenseFile.writeAsBytes([0, 1, 2]);
        await nidFile.writeAsBytes([0, 1, 2]);
      });
    });
  });
}
