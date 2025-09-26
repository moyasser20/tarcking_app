import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:tarcking_app/features/auth/domain/responses/auth_response.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _authRepo;

  ForgetPasswordUseCase(this._authRepo);

  Future<AuthResponse<String>> call(String email) {
    return _authRepo.forgetPassword(email);
  }
}
