import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../domain/model/order_details.dart';
import '../controller/orders_cubit.dart';
import '../controller/orders_state.dart';
import 'order_details_shimmer_loading.dart';
import 'order_details_view.dart';

class OrderDetailsBlocConsumer extends StatelessWidget {
  const OrderDetailsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      buildWhen:
          (previous, current) =>
              current is GetOrderDetailsLoading ||
              current is GetOrderDetailsSuccess ||
              current is GetOrderDetailsError,
      builder: (context, state) {
        switch (state) {
          case GetOrderDetailsLoading():
            return const OrderDetailsShimmerLoading();
          case GetOrderDetailsSuccess():
            return _setupSuccess(state.order);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is GetOrderDetailsError,
      listener: (context, state) {
        switch (state) {
          case GetOrderDetailsError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(OrderDetails order) {
    return OrderDetailsView(order: order);
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
