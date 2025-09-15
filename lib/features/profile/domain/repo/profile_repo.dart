import '../../../../core/networking/api_result.dart';
import '../model/user_profile.dart';

abstract class ProfileRepo {
  Future<ApiResult<UserProfile>> getUserProfile();
  Future<ApiResult<UserProfile>> updateProfile({
    String? name,
    String? email,
    String? phoneNumber,
  });
}
