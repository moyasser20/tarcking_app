// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dio/dio.dart';
// import 'package:tarcking_app/features/auth/api/data_source_impl/auth_remote_data_source_impl.dart';
// import 'package:tarcking_app/features/auth/data/models/apply_response.dart';
// import 'package:tarcking_app/features/auth/data/models/driver.dart';
// import '../mocks/mocks.dart';
//
// void main() {
//   late MockApplyApiClient apiClient;
//   late AuthRemoteDataSourceImpl dataSource;
//
//   setUp(() {
//     apiClient = MockApplyApiClient();
//     dataSource = AuthRemoteDataSourceImpl(apiClient);
//   });
//
//   test('applyDriver returns Driver from ApplyResponse', () async {
//     final driver = Driver(
//       id: "1",
//       firstName: "Ahmed",
//       lastName: "Naser",
//       email: "ahmed@example.com",
//       phone: "0100000000",
//       country: "Egypt",
//       vehicleType: "Car",
//       vehicleNumber: "1234",
//       vehicleLicense: '',
//       nid: '',
//       nidImg: '',
//       gender: '',
//       photo: '',
//       role: '',
//       createdAt: '',
//     );
//
//     // Adjust constructor based on your ApplyResponse definition
//     final response = ApplyResponse(driver: driver, message: '', token: '');
//
//     when(
//       () => apiClient.applyDriver(
//         country: any(named: 'country'),
//         firstName: any(named: 'firstName'),
//         lastName: any(named: 'lastName'),
//         vehicleType: any(named: 'vehicleType'),
//         vehicleNumber: any(named: 'vehicleNumber'),
//         vehicleLicense: any(named: 'vehicleLicense'),
//         nid: any(named: 'nid'),
//         nidImg: any(named: 'nidImg'),
//         email: any(named: 'email'),
//         password: any(named: 'password'),
//         rePassword: any(named: 'rePassword'),
//         gender: any(named: 'gender'),
//         phone: any(named: 'phone'),
//       ),
//     ).thenAnswer((_) async => response);
//
//     final result = await dataSource.applyDriver(
//       country: "Egypt",
//       firstName: "Ahmed",
//       lastName: "Naser",
//       vehicleType: "Car",
//       vehicleNumber: "1234",
//       vehicleLicense: MultipartFile.fromString('fake'),
//       nid: "0000",
//       nidImg: MultipartFile.fromString('fake'),
//       email: "ahmed@example.com",
//       password: "12345678",
//       rePassword: "12345678",
//       gender: "Male",
//       phone: "0100000000",
//     );
//
//     expect(result, isA<Driver>());
//     expect(result.firstName, "Ahmed");
//     expect(result.lastName, "Naser");
//   });
//
//   test('applyDriver returns DriverEntity', () async {
//     final driver = Driver(
//       id: "1",
//       firstName: "Ahmed",
//       lastName: "Naser",
//       email: "ahmed@example.com",
//       phone: "0100000000",
//       country: "Egypt",
//       vehicleType: "Car",
//       vehicleNumber: "1234",
//       vehicleLicense: '',
//       nid: '',
//       nidImg: '',
//       gender: '',
//       photo: '',
//       role: '',
//       createdAt: '',
//     );
//
//     when(
//           () => remote.applyDriver(
//         country: any(named: 'country'),
//         firstName: any(named: 'firstName'),
//         lastName: any(named: 'lastName'),
//         vehicleType: any(named: 'vehicleType'),
//         vehicleNumber: any(named: 'vehicleNumber'),
//         vehicleLicense: any(named: 'vehicleLicense'),
//         nid: any(named: 'nid'),
//         nidImg: any(named: 'nidImg'),
//         email: any(named: 'email'),
//         password: any(named: 'password'),
//         rePassword: any(named: 'rePassword'),
//         gender: any(named: 'gender'),
//         phone: any(named: 'phone'),
//       ),
//     ).thenAnswer((_) async => driver);
//
//     final result = await repo.applyDriver(
//       country: "Egypt",
//       firstName: "Ahmed",
//       lastName: "Naser",
//       vehicleType: "Car",
//       vehicleNumber: "1234",
//       vehicleLicensePath: "path/license.png",
//       nid: "0000",
//       nidImgPath: "path/id.png",
//       email: "ahmed@example.com",
//       password: "12345678",
//       rePassword: "12345678",
//       gender: "Male",
//       phone: "0100000000",
//     );
//
//     expect(result.firstName, "Ahmed");
//     expect(result.lastName, "Naser");
//     expect(result.email, "ahmed@example.com");
//   });
// }
