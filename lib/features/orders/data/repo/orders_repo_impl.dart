import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/model/order.dart';
import '../../domain/model/order_details.dart';
import '../../domain/repo/orders_repo.dart';
import '../remote/orders_api_service.dart';

class OrdersRepoImpl extends OrdersRepo {
  OrdersRepoImpl(this._apiService);

  final OrdersApiService _apiService;

  @override
  Future<ApiResult<List<Order>>> getOrders(int page) async {
    try {
      final response = await _apiService.getOrders(page);
      return Success(
        response.orders?.data.map((e) => e.toOrder()).toList() ?? [],
      );
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<OrderDetails>> getOrderDetails(int orderId) async {
    try {
      final response = await _apiService.getOrderDetails(orderId);
      return Success(response.order.toOrderDetails());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }
}
