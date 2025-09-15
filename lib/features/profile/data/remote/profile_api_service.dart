import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import 'dto/update_profile_request_body.dart';
import 'dto/user_profile_dto.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProfileApiService;

  @GET(ApiConstants.profile)
  Future<UserProfileResponse> getUserProfile();

  @POST(ApiConstants.updateProfile)
  Future<UserProfileDto> updateUserProfile(
    @Body() UpdateProfileRequestBody updateProfileRequestBody,
  );
}
