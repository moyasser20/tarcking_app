import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/driver.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/vehicles_response.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/vehicles.dart';
import 'package:tarcking_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:tarcking_app/features/auth/domain/entities/apply_entites/driver_entity.dart';
import 'package:tarcking_app/features/auth/domain/entities/apply_entites/vehicle_enitity.dart';
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
          nidImgPath: "fake_id.png",
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
        expect(result.email, "ahmed@example.com");
        expect(result.phone, "0100000000");
        expect(result.country, "Egypt");
        expect(result.vehicleType, "Car");
        expect(result.vehicleNumber, "ABC123");
      });

      test('should throw Exception when remote data source fails', () async {
        // Arrange
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
        ).thenThrow(Exception('Remote data source error'));

        // Act & Assert
        expect(
          () => repo.applyDriver(
            country: "Egypt",
            firstName: "Ahmed",
            lastName: "Naser",
            vehicleType: "Car",
            vehicleNumber: "ABC123",
            vehicleLicensePath: "",
            nid: "12345678901234",
            nidImgPath: "id.png",
            email: "ahmed@example.com",
            password: "SecurePassword123!",
            rePassword: "SecurePassword123!",
            gender: "Male",
            phone: "0100000000",
          ),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getVehicles', () {
      test('should return List<VehicleEntity> when successful', () async {
        // Arrange
        final vehicles = [
          Vehicles(
            Id: "507f1f77bcf86cd799439011",
            type: "Car",
            image: "car.png",
            createdAt: "2024-01-01T00:00:00.000Z",
            updatedAt: "2024-01-01T00:00:00.000Z",
          ),
          Vehicles(
            Id: "507f1f77bcf86cd799439012",
            type: "Motorcycle",
            image: "motorcycle.png",
            createdAt: "2024-01-01T00:00:00.000Z",
            updatedAt: "2024-01-01T00:00:00.000Z",
          ),
        ];
        final response = VehiclesResponse(
          message: 'Vehicles retrieved successfully',
          vehicles: vehicles,
        );
        when(() => remote.getVehicles()).thenAnswer((_) async => response);

        // Act
        final result = await repo.getVehicles();

        // Assert
        expect(result, isA<List<VehicleEntity>>());
        expect(result.length, 2);
        expect(result[0].id, "507f1f77bcf86cd799439011");
        expect(result[0].type, "Car");
        expect(result[0].image, "car.png");
        expect(result[0].createdAt, "2024-01-01T00:00:00.000Z");
        expect(result[0].updatedAt, "2024-01-01T00:00:00.000Z");
        expect(result[1].id, "507f1f77bcf86cd799439012");
        expect(result[1].type, "Motorcycle");
        expect(result[1].image, "motorcycle.png");
        expect(result[1].createdAt, "2024-01-01T00:00:00.000Z");
        expect(result[1].updatedAt, "2024-01-01T00:00:00.000Z");
      });

      test('should return empty list when no vehicles found', () async {
        // Arrange
        final response = VehiclesResponse(
          message: 'No vehicles found',
          vehicles: [],
        );
        when(() => remote.getVehicles()).thenAnswer((_) async => response);

        // Act
        final result = await repo.getVehicles();

        // Assert
        expect(result, isA<List<VehicleEntity>>());
        expect(result.isEmpty, isTrue);
      });

      test('should throw Exception when remote data source fails', () async {
        // Arrange
        when(
          () => remote.getVehicles(),
        ).thenThrow(Exception('Remote data source error'));

        // Act & Assert
        expect(() => repo.getVehicles(), throwsA(isA<Exception>()));
      });
    });
  });
}
