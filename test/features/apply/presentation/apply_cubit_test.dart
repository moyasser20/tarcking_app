import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarcking_app/features/apply/domain/entities/driver_entity.dart';
import 'package:tarcking_app/features/apply/domain/use_cases/apply_driver_usecase.dart';
import 'package:tarcking_app/features/apply/presentation/view_model/apply_cubit.dart';

class _MockApplyDriverUseCase extends Mock implements ApplyDriverUseCase {}

void main() {
  late _MockApplyDriverUseCase mockUseCase;
  late ApplyCubit cubit;

  setUp(() {
    mockUseCase = _MockApplyDriverUseCase();
    cubit = ApplyCubit(mockUseCase);
  });

  // Do not close here; blocTest manages lifecycle. If needed, close in specific tests.

  test('initial state is ApplyInitial', () {
    expect(cubit.state, isA<ApplyInitial>());
  });

  blocTest<ApplyCubit, ApplyState>(
    'emits [ApplyLoading, ApplySuccess] when apply succeeds',
    build: () {
      when(
        () => mockUseCase(
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
      ).thenAnswer(
        (_) async => DriverEntity(
          id: '1',
          firstName: 'A',
          lastName: 'B',
          email: 'a@b.com',
          phone: '01000000000',
          country: 'Egypt',
          vehicleType: 'Car',
          vehicleNumber: '123',
        ),
      );
      return cubit;
    },
    act: (cubit) async {
      cubit.firstNameController.text = 'A';
      cubit.lastNameController.text = 'B';
      cubit.vehicleNumberController.text = '123';
      cubit.vehicleLicensePath = '/tmp/lic.png';
      cubit.nidController.text = '123456';
      cubit.nidImagePath = '/tmp/id.png';
      cubit.emailController.text = 'a@b.com';
      cubit.passwordController.text = 'password!1';
      cubit.rePasswordController.text = 'password!1';
      cubit.phoneController.text = '01000000000';
      await cubit.applyDriver();
    },
    expect: () => [isA<ApplyLoading>(), isA<ApplySuccess>()],
  );

  blocTest<ApplyCubit, ApplyState>(
    'emits [ApplyLoading, ApplyError] when apply throws',
    build: () {
      when(
        () => mockUseCase(
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
      ).thenThrow(Exception('network error'));
      return cubit;
    },
    act: (cubit) async {
      cubit.firstNameController.text = 'A';
      cubit.lastNameController.text = 'B';
      cubit.vehicleNumberController.text = '123';
      cubit.vehicleLicensePath = '/tmp/lic.png';
      cubit.nidController.text = '123456';
      cubit.nidImagePath = '/tmp/id.png';
      cubit.emailController.text = 'a@b.com';
      cubit.passwordController.text = 'password!1';
      cubit.rePasswordController.text = 'password!1';
      cubit.phoneController.text = '01000000000';
      await cubit.applyDriver();
    },
    expect: () => [isA<ApplyLoading>(), isA<ApplyError>()],
  );
}
