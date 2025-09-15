import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/cart.dart';
import '../controller/cart_cubit.dart';
import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.products});

  final List<Cart> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: ListView.builder(
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = products[index];
          return CartListViewItem(
            cart: product,
            onDeleteProduct: () {
              context.read<CartCubit>().deleteCartProduct(
                product.product!.id!,
                products,
              );
            },
            onAddProduct: () {
              context.read<CartCubit>().addCartProduct(
                product.product!.id!,
                products,
              );
            },
            onDecreaseProduct: () {
              context.read<CartCubit>().decreaseCartProduct(
                product.product!.id!,
                products,
              );
            },
          );
        },
      ),
    );
  }
}
