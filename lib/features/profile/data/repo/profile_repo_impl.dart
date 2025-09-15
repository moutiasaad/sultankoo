import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/model/user_profile.dart';
import '../../domain/repo/profile_repo.dart';
import '../remote/dto/update_profile_request_body.dart';
import '../remote/profile_api_service.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileApiService _apiService;

  ProfileRepoImpl(this._apiService);

  @override
  Future<ApiResult<UserProfile>> getUserProfile() async {
    try {
      final response = await _apiService.getUserProfile();
      return Success(response.profile.toUserProfile());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<UserProfile>> updateProfile({
    String? name,
    String? email,
    String? phoneNumber,
  }) async {
    try {
      final response = await _apiService.updateUserProfile(
        UpdateProfileRequestBody(
          fullName: name ?? '',
          email: email ?? '',
          phoneNumber: phoneNumber ?? '',
        ),
      );
      return Success(response.toUserProfile());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }
}
