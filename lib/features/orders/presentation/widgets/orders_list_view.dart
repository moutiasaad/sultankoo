import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/order.dart';
import '../controller/orders_cubit.dart';
import 'orders_list_view_item.dart';

class OrdersListView extends StatefulWidget {
  const OrdersListView({super.key, required this.orders});

  final List<Order> orders;

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<OrdersCubit>().loadMoreOrders();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.orders.length + 1,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < widget.orders.length) {
          return OrdersListViewItem(order: widget.orders[index]);
        }
        return null;
      },
    );
  }
}
