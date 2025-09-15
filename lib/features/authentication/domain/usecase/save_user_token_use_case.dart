import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared_pref_helper.dart';

class SaveUserTokenUseCase {
  SaveUserTokenUseCase();

  Future<void> call(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    isLoggedInUser = true;
    cartCubit.getCartProducts();
  }
}
