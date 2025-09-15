import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../controller/orders_cubit.dart';
import '../widgets/empty_orders.dart';
import '../widgets/orders_bloc_consumer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'الطلبات'),
      body: SafeArea(
        child: CustomRefreshIndicator(
          onRefresh: () => _refreshData(context),
          child:
              isLoggedInUser ? const OrdersBlocConsumer() : const EmptyOrders(),
        ),
      ),
    );
  }

  Future<void> _refreshData(BuildContext context) async {
    context.read<OrdersCubit>().getOrders(1, isRefreshing: true);
  }
}
