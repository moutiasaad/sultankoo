import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../domain/model/order.dart';
import '../controller/orders_cubit.dart';
import '../controller/orders_state.dart';
import 'empty_orders.dart';
import 'orders_list_view.dart';
import 'orders_shimmer_loading.dart';

class OrdersBlocConsumer extends StatelessWidget {
  const OrdersBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      buildWhen:
          (previous, current) =>
              current is GetOrdersLoading ||
              current is GetOrdersSuccess ||
              current is GetOrdersError,
      builder: (context, state) {
        switch (state) {
          case GetOrdersLoading():
            return const OrdersShimmerLoading();
          case GetOrdersSuccess():
            return _setupSuccess(state.orders);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is GetOrdersError,
      listener: (context, state) {
        switch (state) {
          case GetOrdersError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(List<Order> orders) {
    return orders.isNotEmpty
        ? OrdersListView(orders: orders)
        : const EmptyOrders();
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
