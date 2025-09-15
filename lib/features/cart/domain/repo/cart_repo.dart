import '../../../../core/networking/api_result.dart';
import '../model/cart.dart';

abstract class CartRepo {
  Future<ApiResult<List<Cart>>> getCartProducts();
  Future<ApiResult<void>> deleteCartProduct(int productId);
  Future<ApiResult<void>> addCartProduct(int productId);
  Future<ApiResult<void>> decreaseCartProduct(int productId);
}
