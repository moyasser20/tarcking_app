import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tarcking_app/core/api/api_constants/api_constants.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_request.dart';
import 'package:tarcking_app/features/auth/data/models/login/login_response.dart';

part 'api_client.g.dart';
@injectable
@RestApi()
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) = _ApiClient;
   @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
