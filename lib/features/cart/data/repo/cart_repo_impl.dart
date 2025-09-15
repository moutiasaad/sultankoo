import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/model/cart.dart';
import '../../domain/repo/cart_repo.dart';
import '../remote/cart_api_service.dart';

class CartRepoImpl extends CartRepo {
  CartRepoImpl(this._apiService);

  final CartApiService _apiService;

  @override
  Future<ApiResult<List<Cart>>> getCartProducts() async {
    try {
      final response = await _apiService.getCartProducts();
      return Success(response.map((e) => e.toCart()).toList());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<void>> deleteCartProduct(int productId) async {
    try {
      await _apiService.deleteCartProduct(productId);
      return const Success(null);
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<void>> addCartProduct(int productId) async {
    try {
      await _apiService.addCartProduct(productId);
      return const Success(null);
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<void>> decreaseCartProduct(int productId) async {
    try {
      await _apiService.decreaseCartProduct(productId);
      return const Success(null);
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }
}
