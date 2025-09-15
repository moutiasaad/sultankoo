import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/widgets/app_home.dart';
import '../../../cart/domain/repo/cart_repo.dart';
import '../../domain/model/category.dart';
import '../../domain/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo, this._cartRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;
  final CartRepo _cartRepo;

  final List<Category> categories = [];

  Future<void> getCategories() async {
    final response = await _homeRepo.getCategories();
    switch (response) {
      case Success():
        categories.clear();
        categories.addAll(response.data);
        break;
      case Failure():
        break;
    }
  }

  Future<void> getCartProducts() async {
    final response = await _cartRepo.getCartProducts();
    switch (response) {
      case Success():
        cartProductsCount.value = response.data.fold(
          0,
          (sum, product) => sum + product.qty!,
        );
      case Failure():
    }
  }

  Future<void> getHome() async {
    emit(GetHomeLoading());
    final response = await _homeRepo.getHome();
    switch (response) {
      case Success():
        emit(GetHomeSuccess(home: response.data));
        break;
      case Failure():
        emit(GetHomeError(error: response.error));
        break;
    }
  }
}
