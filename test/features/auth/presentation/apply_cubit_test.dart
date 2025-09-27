import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/auth/domain/usecases/apply/apply_driver_usecase.dart';
import 'package:tarcking_app/features/auth/presentation/apply/view_model/apply_cubit.dart';
import 'package:tarcking_app/features/auth/domain/entities/driver_entity.dart';
import '../mocks/mocks.dart';

void main() {
  late MockAuthRepo repo;
  late ApplyDriverUseCase usecase;
  late ApplyCubit cubit;

  setUp(() {
    repo = MockAuthRepo();
    usecase = ApplyDriverUseCase(repo);
    cubit = ApplyCubit(usecase);
  });

  test('initial state is ApplyInitial', () {
    expect(cubit.state, isA<ApplyInitial>());
  });

  test('applyDriver emits ApplyLoading then ApplySuccess', () async {
    // Return a real DriverEntity instead of FakeDriverEntity
    final driverEntity = DriverEntity(
      id: "1",
      firstName: "Ahmed",
      lastName: "Naser",
      email: "ahmed@example.com",
      phone: "0100000000",
      country: "Egypt",
      vehicleType: "Car",
      vehicleNumber: "1234",
    );

    when(
      () => repo.applyDriver(
        country: any(named: 'country'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        vehicleType: any(named: 'vehicleType'),
        vehicleNumber: any(named: 'vehicleNumber'),
        vehicleLicensePath: any(named: 'vehicleLicensePath'),
        nid: any(named: 'nid'),
        nidImgPath: any(named: 'nidImgPath'),
        email: any(named: 'email'),
        password: any(named: 'password'),
        rePassword: any(named: 'rePassword'),
        gender: any(named: 'gender'),
        phone: any(named: 'phone'),
      ),
    ).thenAnswer((_) async => driverEntity);

    cubit.firstNameController.text = "Ahmed";
    cubit.lastNameController.text = "Naser";
    cubit.vehicleNumberController.text = "1234";
    cubit.emailController.text = "ahmed@example.com";
    cubit.phoneController.text = "0100000000";
    cubit.nidController.text = "0000";
    cubit.passwordController.text = "12345678";
    cubit.rePasswordController.text = "12345678";
    cubit.vehicleLicensePath = "path/license.png";
    cubit.nidImagePath = "path/id.png";
    cubit.gender = "Male";

    final states = <ApplyState>[];
    cubit.stream.listen(states.add);

    await cubit.applyDriver();

    expect(states.first, isA<ApplyLoading>());
    expect(states.last, isA<ApplySuccess>());
  });
}
