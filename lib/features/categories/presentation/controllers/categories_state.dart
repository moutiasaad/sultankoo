import '../../../home/domain/model/category.dart';
import '../../domain/model/product.dart';

sealed class CategoriesState<T> {}

class CategoriesInitial<T> extends CategoriesState<T> {}

class GetCategoriesLoading<T> extends CategoriesState<T> {}

class GetCategoriesSuccess<T> extends CategoriesState<T> {
  final List<Category> categories;

  GetCategoriesSuccess({required this.categories});
}

class GetCategoriesError<T> extends CategoriesState<T> {
  final String? error;

  GetCategoriesError({required this.error});
}

class GetCategoryProductsLoading<T> extends CategoriesState<T> {}

class GetCategoryProductsSuccess<T> extends CategoriesState<T> {
  final List<Product> products;

  GetCategoryProductsSuccess({required this.products});
}

class GetCategoryProductsError<T> extends CategoriesState<T> {
  final String? error;

  GetCategoryProductsError({required this.error});
}

class AddCartProductLoading<T> extends CategoriesState<T> {}

class AddCartProductSuccess<T> extends CategoriesState<T> {}

class AddCartProductError<T> extends CategoriesState<T> {
  final String? error;

  AddCartProductError({required this.error});
}
