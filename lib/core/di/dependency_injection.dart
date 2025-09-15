import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/remote/auth_api_service.dart';
import '../../features/authentication/data/repo/auth_repo_impl.dart';
import '../../features/authentication/domain/repo/auth_repo.dart';
import '../../features/authentication/domain/usecase/save_user_token_use_case.dart';
import '../../features/authentication/presentation/controller/auth_cubit.dart';
import '../../features/cart/data/remote/cart_api_service.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/domain/repo/cart_repo.dart';
import '../../features/cart/presentation/controller/cart_cubit.dart';
import '../../features/categories/data/remote/categories_api_service.dart';
import '../../features/categories/data/repo/categories_repo_impl.dart';
import '../../features/categories/domain/repo/categories_repo.dart';
import '../../features/categories/presentation/controllers/categories_cubit.dart';
import '../../features/home/data/remote/home_api_service.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/repo/home_repo.dart';
import '../../features/home/presentation/controllers/home_cubit.dart';
import '../../features/orders/data/remote/orders_api_service.dart';
import '../../features/orders/data/repo/orders_repo_impl.dart';
import '../../features/orders/domain/repo/orders_repo.dart';
import '../../features/orders/presentation/controller/orders_cubit.dart';
import '../../features/profile/data/remote/profile_api_service.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/domain/repo/profile_repo.dart';
import '../../features/profile/presentation/controller/profile_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // Auth
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthApiService>()),
  );
  getIt.registerLazySingleton<SaveUserTokenUseCase>(
    () => SaveUserTokenUseCase(),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt()));

  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<HomeApiService>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt<HomeRepo>(), getIt<CartRepo>()),
  );

  // Categories
  getIt.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(dio),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(getIt<CategoriesApiService>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepo>()),
  );

  // Cart
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(getIt<CartApiService>()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));

  // Orders
  getIt.registerLazySingleton<OrdersApiService>(() => OrdersApiService(dio));
  getIt.registerLazySingleton<OrdersRepo>(
    () => OrdersRepoImpl(getIt<OrdersApiService>()),
  );
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt<OrdersRepo>()));

  // Profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(getIt<ProfileApiService>()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));
}
