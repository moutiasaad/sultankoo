import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import 'dto/login_request_body.dart';
import 'dto/otp_dto.dart';
import 'dto/otp_request_body.dart';
import 'dto/token_dto.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<OtpDto> signIn(@Body() LogInRequestBody logInRequestBody);

  @POST(ApiConstants.verifyOtp)
  Future<TokenDto> verifyOtp(@Body() OtpRequestBody otpRequestBody);
}
