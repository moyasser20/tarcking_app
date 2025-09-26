import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tarcking_app/core/api/api_constants/api_constants.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';

import '../../../features/auth/data/models/forget_password_models/forget_password_request.dart';
import '../../../features/auth/data/models/forget_password_models/reset_password_request_model.dart';
import '../../../features/auth/data/models/forget_password_models/verify_code_request_model.dart';
import '../api_constants/end_points.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) = _ApiClient;

  @POST(EndPoints.forgetPassword)
  Future<String> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST(EndPoints.verifyReset)
  Future<String> verifyResetCode(
    @Body() VerifyCodeRequestModel verifyResetCode,
  );

  @PUT(EndPoints.resetPassword)
  Future<String> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequestModel,
  );
  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
