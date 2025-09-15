import '../../../../core/networking/api_result.dart';
import '../../../home/domain/model/category.dart';
import '../model/product.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Product>>> getCategoryProducts(int categoryId);
  Future<ApiResult<void>> addCartProduct(int productId);
}
