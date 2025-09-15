import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import 'dto/category_dto.dart';
import 'dto/home_dto.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _HomeApiService;

  @GET(ApiConstants.categories)
  Future<List<CategoryDto>> getCategories();

  @GET(ApiConstants.home)
  Future<HomeDto> getHome();
}
