import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import '../../../../../../core/common/widgets/custom_snackbar_widget.dart';
import '../../../../../../core/contants/app_images.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/route_names.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../viewmodel/reset_password_viewmodel.dart';
import '../../viewmodel/states/reset_code_states.dart';
import '../widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ResetPasswordCubit>().initializeListeners();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ResetPasswordCubit>().setEmail(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          local.password,
          style: const TextStyle(
              color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            showCustomSnackBar(context, local.passwordUpdatedSuccessMsg, isError: false);
            Navigator.pushNamed(context, AppRoutes.login);
          } else if (state is ResetPasswordErrorState) {
            showCustomSnackBar(context, state.message, isError: true);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  local.resetPassword,
                  style:
                      const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  local.resetPasswordUnderMsg,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                ResetPasswordForm(formKey: _formKey),
              ],
            ).setHorizontalAndVerticalPadding(context, 0.055, 0.05),
          );
        },
      ),
    );
  }
}
