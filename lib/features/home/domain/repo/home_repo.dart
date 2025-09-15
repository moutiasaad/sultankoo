import '../../../../core/networking/api_result.dart';
import '../model/category.dart';
import '../model/home.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Home>>> getHome();
}
