import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/auth/data/models/driver.dart';
import 'package:tarcking_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import '../mocks/mocks.dart';

void main() {
  late MockAuthRemoteDataSource remote;
  late AuthRepoImpl repo;

  setUp(() {
    remote = MockAuthRemoteDataSource();
    repo = AuthRepoImpl(remote);
  });

  test('applyDriver returns DriverEntity', () async {
    final driver = Driver(
      id: "1",
      firstName: "Ahmed",
      lastName: "Naser",
      email: "ahmed@example.com",
      phone: "0100000000",
      country: "Egypt",
      vehicleType: "Car",
      vehicleNumber: "1234",
      vehicleLicense: '',
      nid: '',
      nidImg: '',
      gender: '',
      photo: '',
      role: '',
      createdAt: '',
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

    final result = await repo.applyDriver(
      country: "Egypt",
      firstName: "Ahmed",
      lastName: "Naser",
      vehicleType: "Car",
      vehicleNumber: "1234",
      vehicleLicensePath: "path/license.png",
      nid: "0000",
      nidImgPath: "path/id.png",
      email: "ahmed@example.com",
      password: "12345678",
      rePassword: "12345678",
      gender: "Male",
      phone: "0100000000",
    );

    expect(result.firstName, "Ahmed");
    expect(result.lastName, "Naser");
    expect(result.email, "ahmed@example.com");
  });
}
