import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';
import 'package:tarcking_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class LoginUsecase {
  final AuthRepo authRepo;

  LoginUsecase(this.authRepo);

  Future<LoginResponse> invoke(LoginRequest loginRequest) async {
    return authRepo.login(loginRequest);
  }
}
