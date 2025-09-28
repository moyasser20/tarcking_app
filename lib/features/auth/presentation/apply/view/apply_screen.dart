import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tarcking_app/core/contants/countries.dart';
import 'package:tarcking_app/core/extensions/countryes_flages.dart';
import 'package:tarcking_app/core/widgets/custom_elevated_button.dart';
import 'package:tarcking_app/core/widgets/custom_drobdown_country_filed.dart';
import 'package:tarcking_app/core/widgets/custom_text_field.dart';
import 'package:tarcking_app/core/widgets/coustom_app_bar.dart';
import '../../../../../core/common/widgets/custome_loading_indicator.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/apply_entites/vehicle_enitity.dart';
import '../view_model/apply_cubit.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ApplyCubit>()..loadVehicles(),
      child: BlocListener<ApplyCubit, ApplyState>(
        listener: (context, state) {
          if (state is ApplySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pushNamed(context, AppRoutes.applicationApproved);
          } else if (state is ApplyError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<ApplyCubit, ApplyState>(
          builder: (context, state) {
            final cubit = context.read<ApplyCubit>();

            if (state is ApplyLoading) {
              return const Scaffold(
                backgroundColor: AppColors.white,
                body: AppLoadingIndicator(),
              );
            }

            return Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CoustomAppBar(title: 'Apply'),
                        const SizedBox(height: 25.0),
                        Text(
                          'Welcome!!',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'You want to be a delivery man?\nJoin our team ',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Colors.blueGrey,
                          ),
                        ),
                        Form(
                          key: cubit.formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomDropdownField<Country>(
                                  label: 'Country',
                                  value: cubit.selectedCountry,
                                  items: Countries.countryes,
                                  itemLabel: (country) =>
                                  "${country.code.toFlag} ${country.name}",
                                  onChanged: cubit.setCountry,
                                ),
                                if (cubit.vehicles.isNotEmpty)
                                  CustomDropdownField<VehicleEntity>(
                                    label: 'Vehicle type',
                                    value: cubit.selectedVehicle ?? cubit.vehicles.first,
                                    items: cubit.vehicles,
                                    itemLabel: (v) => v.type ?? '',
                                    onChanged: cubit.setVehicleType,
                                  )
                                else
                                  const Text("No vehicles available"),
                                CustomTextFormField(
                                  label: 'First legal name',
                                  hint: 'Enter first legal name',
                                  controller: cubit.firstNameController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'First name is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'Second legal name',
                                  hint: 'Enter second legal name',
                                  controller: cubit.lastNameController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Second name is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'Vehicle number',
                                  hint: 'Enter vehicle number',
                                  controller: cubit.vehicleNumberController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Vehicle number is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'Vehicle license',
                                  hint: 'Upload license photo',
                                  controller: cubit.vehicleLicenseController,
                                  readonly: true,
                                  onPressed: () async {
                                    final result = await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                    );
                                    if (result != null && result.files.single.path != null) {
                                      cubit.setVehicleLicensePath(result.files.single.path);
                                    }
                                  },
                                  validator: (v) {
                                    if ((cubit.vehicleLicensePath ?? '').isEmpty) {
                                      return 'Vehicle license image is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'Email',
                                  hint: 'Enter your email',
                                  controller: cubit.emailController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Email is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'Phone number',
                                  hint: 'Enter phone number',
                                  controller: cubit.phoneController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Phone is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'ID number',
                                  hint: 'Enter national ID number',
                                  controller: cubit.nidController,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'ID number is required';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  label: 'ID image',
                                  hint: 'Upload ID image',
                                  controller: cubit.nidImgController,
                                  readonly: true,
                                  onPressed: () async {
                                    final result = await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                    );
                                    if (result != null && result.files.single.path != null) {
                                      cubit.setNidImagePath(result.files.single.path);
                                    }
                                  },
                                  validator: (v) {
                                    if ((cubit.nidImagePath ?? '').isEmpty) {
                                      return 'ID image is required';
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: 'Password',
                                        hint: 'Enter password',
                                        controller: cubit.passwordController,
                                        obscureText: true,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (v.length < 8) {
                                            return 'Minimum 8 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: 'Confirm password',
                                        hint: 'Confirm password',
                                        controller: cubit.rePasswordController,
                                        obscureText: true,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) {
                                            return 'Confirm your password';
                                          }
                                          if (v != cubit.passwordController.text) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Gender',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'female',
                                          groupValue: cubit.gender,
                                          onChanged: cubit.setGender,
                                        ),
                                        const Text('Female'),
                                      ],
                                    ),
                                    const SizedBox(width: 30),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'male',
                                          groupValue: cubit.gender,
                                          onChanged: cubit.setGender,
                                        ),
                                        const Text('Male'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              text: 'Continue',
                              isLoading: state is ApplyLoading,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.applyDriver();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
