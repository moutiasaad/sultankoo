import '../../domain/model/order.dart';
import '../../domain/model/order_details.dart';

sealed class OrdersState<T> {}

class OrdersInitial<T> extends OrdersState<T> {}

class GetOrdersLoading<T> extends OrdersState<T> {}

class GetOrdersSuccess<T> extends OrdersState<T> {
  final List<Order> orders;

  GetOrdersSuccess({required this.orders});
}

class GetOrdersError<T> extends OrdersState<T> {
  final String? error;

  GetOrdersError({required this.error});
}

class GetOrderDetailsLoading<T> extends OrdersState<T> {}

class GetOrderDetailsSuccess<T> extends OrdersState<T> {
  final OrderDetails order;

  GetOrderDetailsSuccess({required this.order});
}

class GetOrderDetailsError<T> extends OrdersState<T> {
  final String? error;

  GetOrderDetailsError({required this.error});
}
