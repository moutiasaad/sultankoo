import '../../../../core/networking/api_result.dart';
import '../model/otp.dart';
import '../model/token.dart';

abstract class AuthRepo {
  Future<ApiResult<Otp>> signIn(String email);
  Future<ApiResult<Token>> verifyOtp(
    String email,
    String otpCode,
    String otpKey,
  );
}
