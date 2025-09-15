import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/widgets/app_home.dart';
import '../../../home/domain/model/category.dart';
import '../../domain/repo/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());

  final CategoriesRepo _homeRepo;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final response = await _homeRepo.getCategories();
    switch (response) {
      case Success():
        emit(GetCategoriesSuccess(categories: response.data));
      case Failure():
        emit(GetCategoriesError(error: response.error));
    }
  }

  Future<void> getCategoryProducts(int categoryId) async {
    emit(GetCategoryProductsLoading());
    final response = await _homeRepo.getCategoryProducts(categoryId);
    switch (response) {
      case Success():
        emit(GetCategoryProductsSuccess(products: response.data));
      case Failure():
        emit(GetCategoryProductsError(error: response.error));
    }
  }

  Future<void> addCartProduct(int productId) async {
    emit(AddCartProductLoading());
    final response = await _homeRepo.addCartProduct(productId);
    switch (response) {
      case Success():
        cartProductsCount.value++;
        emit(AddCartProductSuccess());
      case Failure():
        emit(AddCartProductError(error: response.error));
    }
  }

  void searchCategory(String query, List<Category> categories) {
    if (query.isEmpty) {
      emit(GetCategoriesSuccess(categories: categories));
    } else {
      final filteredCategories =
          categories
              .where(
                (category) =>
                    category.name?.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ??
                    false,
              )
              .toList();
      emit(GetCategoriesSuccess(categories: filteredCategories));
    }
  }
}
