import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/widgets/app_home.dart';
import '../../domain/model/cart.dart';
import '../../domain/repo/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());

  final CartRepo _cartRepo;

  Future<void> getCartProducts() async {
    emit(GetCartProductsLoading());
    final response = await _cartRepo.getCartProducts();
    switch (response) {
      case Success():
        cartProductsCount.value = response.data.fold(
          0,
          (sum, product) => sum + product.qty!,
        );
        emit(GetCartProductsSuccess(products: response.data));
      case Failure():
        emit(GetCartProductsError(error: response.error));
    }
  }

  Future<void> deleteCartProduct(int productId, List<Cart> products) async {
    final response = await _cartRepo.deleteCartProduct(productId);
    switch (response) {
      case Success():
        cartProductsCount.value =
            cartProductsCount.value -
            products
                .firstWhere((product) => product.product!.id == productId)
                .qty!;
        products.removeWhere((product) => product.product!.id == productId);
        emit(GetCartProductsSuccess(products: products));
      case Failure():
    }
  }

  Future<void> addCartProduct(int productId, List<Cart> products) async {
    final response = await _cartRepo.addCartProduct(productId);
    switch (response) {
      case Success():
        final product = products.firstWhere(
          (product) => product.product!.id == productId,
        );
        cartProductsCount.value++;
        product.qty = product.qty! + 1;
        emit(GetCartProductsSuccess(products: products));
      case Failure():
    }
  }

  Future<void> decreaseCartProduct(int productId, List<Cart> products) async {
    final response = await _cartRepo.decreaseCartProduct(productId);
    switch (response) {
      case Success():
        final product = products.firstWhere(
          (product) => product.product!.id == productId,
        );
        product.qty = product.qty! - 1;
        cartProductsCount.value--;
        emit(GetCartProductsSuccess(products: products));
      case Failure():
    }
  }
}
