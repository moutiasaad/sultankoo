import '../../domain/model/cart.dart';

sealed class CartState<T> {}

class CartInitial<T> extends CartState<T> {}

class GetCartProductsLoading<T> extends CartState<T> {}

class GetCartProductsSuccess<T> extends CartState<T> {
  final List<Cart> products;

  GetCartProductsSuccess({required this.products});
}

class GetCartProductsError<T> extends CartState<T> {
  final String? error;

  GetCartProductsError({required this.error});
}
