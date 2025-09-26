import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/core/contants/countries.dart';
import 'package:tarcking_app/core/contants/vehicles.dart';
import 'package:tarcking_app/features/auth/domain/use_cases/apply_driver_usecase.dart';
part 'apply_state.dart';

@injectable
class ApplyCubit extends Cubit<ApplyState> {
  final ApplyDriverUseCase _applyDriverUseCase;

  ApplyCubit(this._applyDriverUseCase) : super(ApplyInitial()) {
    selectedCountry = Countries.countryes.first;
    selectedVehicle = Vehicles.vehicles.first;
  }

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final vehicleNumberController = TextEditingController();
  final vehicleLicenseController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nidController = TextEditingController();
  final nidImgController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  String? selectedVehicle;
  dynamic selectedCountry;
  String? gender;
  String? vehicleLicensePath;
  String? nidImagePath;

  void setVehicleLicensePath(String? path) {
    vehicleLicensePath = path;
    if (path != null) {
      vehicleLicenseController.text = path.split('/').last;
    }
    emit(ApplyChanged());
  }

  void setNidImagePath(String? path) {
    nidImagePath = path;
    if (path != null) {
      nidImgController.text = path.split('/').last;
    }
    emit(ApplyChanged());
  }

  void setCountry(dynamic country) {
    selectedCountry = country;
    emit(ApplyChanged());
  }

  void setVehicleType(String? type) {
    selectedVehicle = type;
    emit(ApplyChanged());
  }

  void setGender(String? value) {
    gender = value;
    emit(ApplyChanged());
  }

  Future<void> applyDriver() async {
    emit(ApplyLoading());

    try {
      final countryName = (selectedCountry as Country).name;
      final vehicleType = selectedVehicle ?? Vehicles.vehicles.first;
      final selectedGender = gender ?? 'Male';

      await _applyDriverUseCase(
        country: countryName,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        vehicleType: vehicleType,
        vehicleNumber: vehicleNumberController.text.trim(),
        vehicleLicensePath: vehicleLicensePath ?? '',
        nid: nidController.text.trim(),
        nidImgPath: nidImagePath ?? '',
        email: emailController.text.trim(),
        password: passwordController.text,
        rePassword: rePasswordController.text,
        gender: selectedGender,
        phone: phoneController.text.trim(),
      );

      emit(ApplySuccess("Application submitted successfully"));
    } catch (e) {
      emit(ApplyError("Failed to apply: $e"));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    vehicleNumberController.dispose();
    vehicleLicenseController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nidController.dispose();
    nidImgController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    return super.close();
  }
}
