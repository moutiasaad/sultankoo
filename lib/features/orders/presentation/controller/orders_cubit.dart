import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/model/order.dart';
import '../../domain/repo/orders_repo.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo) : super(OrdersInitial());

  final OrdersRepo _ordersRepo;
  final List<Order> _orders = [];
  int _currentPage = 1;
  bool _hasMoreOrders = true;
  bool _isFetching = false;

  Future<void> getOrders(int page, {bool isRefreshing = false}) async {
    if (_isFetching) return;

    _isFetching = true;

    if (isRefreshing) {
      _currentPage = 1;
      _orders.clear();
      _hasMoreOrders = true;
      emit(GetOrdersLoading());
    }

    final response = await _ordersRepo.getOrders(page);

    switch (response) {
      case Success():
        if (response.data.isEmpty) {
          _hasMoreOrders = false;
        } else {
          _orders.addAll(response.data);
          _currentPage++;
        }
        emit(GetOrdersSuccess(orders: _orders));
      case Failure():
        emit(GetOrdersError(error: response.error));
    }
    _isFetching = false;
  }

  void loadMoreOrders() {
    if (_hasMoreOrders) {
      getOrders(_currentPage);
    }
  }

  Future<void> getOrderDetails(int orderId) async {
    emit(GetOrderDetailsLoading());
    final response = await _ordersRepo.getOrderDetails(orderId);
    switch (response) {
      case Success():
        emit(GetOrderDetailsSuccess(order: response.data));
      case Failure():
        emit(GetOrderDetailsError(error: response.error));
    }
  }
}
