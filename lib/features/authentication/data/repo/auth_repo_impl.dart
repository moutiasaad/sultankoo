import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/model/otp.dart';
import '../../domain/model/token.dart';
import '../../domain/repo/auth_repo.dart';
import '../remote/auth_api_service.dart';
import '../remote/dto/login_request_body.dart';
import '../remote/dto/otp_request_body.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<ApiResult<Otp>> signIn(String email) async {
    try {
      final response = await _apiService.signIn(LogInRequestBody(email: email));
      return Success(response.toOtp());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<Token>> verifyOtp(
    String email,
    String otpCode,
    String otpKey,
  ) async {
    try {
      final response = await _apiService.verifyOtp(
        OtpRequestBody(email: email, otpCode: otpCode, otpKey: otpKey),
      );
      return Success(response.toToken());
    } catch (error) {
      return const Failure("رمز التحقق غير صالح.");
    }
  }
}
