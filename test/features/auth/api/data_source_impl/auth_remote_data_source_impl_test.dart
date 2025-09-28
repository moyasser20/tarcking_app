import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/api/data_source_impl/auth_remote_data_source_impl.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/apply_response.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/driver.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/vehicles_response.dart';
import 'package:tarcking_app/features/auth/data/models/apply_models/vehicles.dart';
import '../../mocks/mocks.dart';

void main() {
  late MockApplyApiClient apiClient;
  late AuthRemoteDatasourceImpl dataSource;

  setUpAll(() {
    registerFallbackValue(MultipartFile.fromString(''));
  });

  setUp(() {
    apiClient = MockApplyApiClient();
    dataSource = AuthRemoteDatasourceImpl(apiClient);
  });

  group('AuthRemoteDatasourceImpl', () {
    group('applyDriver', () {
      test('should return Driver from ApplyResponse when successful', () async {
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
        final response = ApplyResponse(
          driver: driver,
          message: 'ok',
          token: 'token',
        );
        when(
          () => apiClient.applyDriver(
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
        ).thenAnswer((_) async => response);

        // Act
        final result = await dataSource.applyDriver(
          country: "Egypt",
          firstName: "Ahmed",
          lastName: "Naser",
          vehicleType: "Car",
          vehicleNumber: "ABC123",
          vehicleLicense: MultipartFile.fromString('license content'),
          nid: "12345678901234",
          nidImg: MultipartFile.fromString('nid content'),
          email: "ahmed@example.com",
          password: "SecurePassword123!",
          rePassword: "SecurePassword123!",
          gender: "Male",
          phone: "0100000000",
        );

        // Assert
        expect(result, isA<Driver>());
        expect(result.firstName, "Ahmed");
        expect(result.lastName, "Naser");
        expect(result.email, "ahmed@example.com");
        expect(result.country, "Egypt");
        expect(result.vehicleType, "Car");
        expect(result.vehicleNumber, "ABC123");
        expect(result.gender, "Male");
        expect(result.phone, "0100000000");
      });

      test('should throw Exception when DioException occurs', () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 400,
            data: {'message': 'Invalid request data'},
          ),
        );
        when(
          () => apiClient.applyDriver(
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
        ).thenThrow(dioException);

        // Act & Assert
        expect(
          () => dataSource.applyDriver(
            country: "Egypt",
            firstName: "Ahmed",
            lastName: "Naser",
            vehicleType: "Car",
            vehicleNumber: "ABC123",
            vehicleLicense: MultipartFile.fromString('license content'),
            nid: "12345678901234",
            nidImg: MultipartFile.fromString('nid content'),
            email: "ahmed@example.com",
            password: "SecurePassword123!",
            rePassword: "SecurePassword123!",
            gender: "Male",
            phone: "0100000000",
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('should throw Exception when generic error occurs', () async {
        // Arrange
        when(
          () => apiClient.applyDriver(
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
        ).thenThrow(Exception('Generic error'));

        // Act & Assert
        expect(
          () => dataSource.applyDriver(
            country: "Egypt",
            firstName: "Ahmed",
            lastName: "Naser",
            vehicleType: "Car",
            vehicleNumber: "ABC123",
            vehicleLicense: MultipartFile.fromString('license content'),
            nid: "12345678901234",
            nidImg: MultipartFile.fromString('nid content'),
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
      test('should return VehiclesResponse when successful', () async {
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
        when(() => apiClient.getVehicles()).thenAnswer((_) async => response);

        // Act
        final result = await dataSource.getVehicles();

        // Assert
        expect(result, isA<VehiclesResponse>());
        expect(result.message, 'Vehicles retrieved successfully');
        expect(result.vehicles, isNotNull);
        expect(result.vehicles!.length, 2);
        expect(result.vehicles!.first.type, "Car");
        expect(result.vehicles!.last.type, "Motorcycle");
      });

      test(
        'should return empty VehiclesResponse when no vehicles found',
        () async {
          // Arrange
          final response = VehiclesResponse(
            message: 'No vehicles found',
            vehicles: [],
          );
          when(() => apiClient.getVehicles()).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.getVehicles();

          // Assert
          expect(result, isA<VehiclesResponse>());
          expect(result.message, 'No vehicles found');
          expect(result.vehicles, isNotNull);
          expect(result.vehicles!.isEmpty, isTrue);
        },
      );

      test('should throw Exception when DioException occurs', () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 500,
            data: {'message': 'Internal server error'},
          ),
        );
        when(() => apiClient.getVehicles()).thenThrow(dioException);

        // Act & Assert
        expect(() => dataSource.getVehicles(), throwsA(isA<Exception>()));
      });

      test('should throw Exception when generic error occurs', () async {
        // Arrange
        when(
          () => apiClient.getVehicles(),
        ).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(() => dataSource.getVehicles(), throwsA(isA<Exception>()));
      });
    });
  });
}
