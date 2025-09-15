import '../../domain/model/category.dart';
import '../../domain/model/home.dart';

sealed class HomeState<T> {}

class HomeInitial<T> extends HomeState<T> {}

class GetHomeLoading<T> extends HomeState<T> {}

class GetHomeSuccess<T> extends HomeState<T> {
  final List<Home> home;

  GetHomeSuccess({required this.home});
}

class GetHomeError<T> extends HomeState<T> {
  final String? error;

  GetHomeError({required this.error});
}

class GetCategoriesLoading<T> extends HomeState<T> {}

class GetCategoriesSuccess<T> extends HomeState<T> {
  final List<Category> categories;

  GetCategoriesSuccess({required this.categories});
}

class GetCategoriesError<T> extends HomeState<T> {
  final String? error;

  GetCategoriesError({required this.error});
}
