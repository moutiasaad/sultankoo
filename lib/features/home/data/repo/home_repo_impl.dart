import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/model/category.dart';
import '../../domain/model/home.dart';
import '../../domain/repo/home_repo.dart';
import '../remote/home_api_service.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeApiService _apiService;

  HomeRepoImpl(this._apiService);

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
  Future<ApiResult<List<Home>>> getHome() async {
    try {
      final response = await _apiService.getHome();
      return Success(response.data?.map((e) => e.toHome()).toList() ?? []);
    } catch (error) {
      return Failure(ErrorHandler.handle(error).apiErrorModel.message);
    }
  }
}
