import 'package:flutter/material.dart';

import '../../../../core/widgets/top_app_bar.dart';
import '../widgets/order_details_bloc_consumer.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(title: 'تفاصيل الطلب'),
      body: SafeArea(child: OrderDetailsBlocConsumer()),
    );
  }
}
