import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../domain/model/cart.dart';
import '../controller/cart_cubit.dart';
import '../controller/cart_state.dart';
import 'cart_list_view.dart';
import 'cart_shimmer_loading.dart';
import 'empty_cart.dart';

class CartBlocConsumer extends StatelessWidget {
  const CartBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      buildWhen:
          (previous, current) =>
              current is GetCartProductsLoading ||
              current is GetCartProductsSuccess ||
              current is GetCartProductsError,
      builder: (context, state) {
        switch (state) {
          case GetCartProductsLoading():
            return const CartShimmerLoading();
          case GetCartProductsSuccess():
            return _setupSuccess(state.products);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is GetCartProductsError,
      listener: (context, state) {
        switch (state) {
          case GetCartProductsError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(List<Cart> products) {
    return products.isNotEmpty
        ? CartListView(products: products)
        : const EmptyCart();
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
