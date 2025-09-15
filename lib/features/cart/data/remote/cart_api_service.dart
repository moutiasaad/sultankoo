import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import 'dto/cart_dto.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartApiService {
  factory CartApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _CartApiService;

  @GET(ApiConstants.cart)
  Future<List<CartDto>> getCartProducts();

  @DELETE(ApiConstants.cartDelete)
  Future<void> deleteCartProduct(@Path('productId') int productId);

  @POST(ApiConstants.cartAdd)
  Future<void> addCartProduct(@Path('productId') int productId);

  @POST(ApiConstants.cartDecrease)
  Future<void> decreaseCartProduct(@Path('productId') int productId);
}
