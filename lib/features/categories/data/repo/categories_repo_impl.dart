import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/domain/model/category.dart';
import '../../domain/model/product.dart';
import '../../domain/repo/categories_repo.dart';
import '../remote/categories_api_service.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesApiService _apiService;

  CategoriesRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return Success(response.map((e) => e.toCategory()).toList());
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }

  @override
  Future<ApiResult<List<Product>>> getCategoryProducts(int categoryId) async {
    try {
      final response = await _apiService.getCategoryProducts(categoryId);
      return Success(response.map((e) => e.toProduct()).toList());
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
}