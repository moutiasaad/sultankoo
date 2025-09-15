import '../../../../core/networking/api_result.dart';
import '../model/order.dart';
import '../model/order_details.dart';

abstract class OrdersRepo {
  Future<ApiResult<List<Order>>> getOrders(int page);
  Future<ApiResult<OrderDetails>> getOrderDetails(int orderId);
}
