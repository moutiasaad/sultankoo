import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import 'dto/order_details_dto.dart';
import 'dto/order_dto.dart';

part 'orders_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OrdersApiService {
  factory OrdersApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _OrdersApiService;

  @GET(ApiConstants.orders)
  Future<OrdersResponseDto> getOrders(@Query('page') int page);

  @GET(ApiConstants.orderDetails)
  Future<OrderResponseDto> getOrderDetails(@Path('orderId') int orderId);
}
