import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/domain/services/auth_services.dart';
import 'package:tarcking_app/features/auth/domain/usecases/login_usecase/login_usecase.dart';
import 'package:tarcking_app/features/auth/presentation/login/cubit/login_states.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  final LoginUsecase loginUsecase;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginCubit({required this.loginUsecase}) : super(LoginInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
    void toggleRememberMe(bool boxValue) {
    rememberMe = boxValue;
    emit(ChangeRememberMeState());
  }

  Future<void> login({required String email, required String password}) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());
    try {
      final request = LoginRequest(
        email: email.trim(),
        password: password.trim(),
      );

    final response = await  loginUsecase.invoke(request);
        if (response.token!=null && response.token!.isNotEmpty) {
      await AuthService.saveAuthToken(response.token ?? "");
      if (rememberMe) {
        await AuthService.saveRememberMe(rememberMe);
      }
    }
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(errorMessage: "Failed to login. Please try again."));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
