import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../home/data/remote/dto/category_dto.dart';
import 'dto/product_dto.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _CategoriesApiService;

  @GET(ApiConstants.categories)
  Future<List<CategoryDto>> getCategories();

  @GET(ApiConstants.categoryProducts)
  Future<List<ProductDto>> getCategoryProducts(
    @Path('categoryId') int categoryId,
  );

  @POST(ApiConstants.cartAdd)
  Future<void> addCartProduct(@Path('productId') int productId);
}
