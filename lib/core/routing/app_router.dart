import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sultankoo/features/orders/presentation/screens/order_tracking_web_view.dart';

import '../../features/authentication/presentation/controller/auth_cubit.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/authentication/presentation/screens/verify_otp_screen.dart';
import '../../features/cart/presentation/controller/cart_cubit.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/cart/presentation/screens/payment_web_view.dart';
import '../../features/categories/domain/model/product.dart';
import '../../features/categories/presentation/controllers/categories_cubit.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/categories/presentation/screens/category_products_screen.dart';
import '../../features/categories/presentation/screens/product_screen.dart';
import '../../features/home/domain/model/category.dart';
import '../../features/home/presentation/controllers/home_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/orders/presentation/controller/orders_cubit.dart';
import '../../features/orders/presentation/screens/order_details_screen.dart';
import '../../features/orders/presentation/screens/orders_screen.dart';
import '../../features/profile/presentation/controller/profile_cubit.dart';
import '../../features/profile/presentation/screens/account_screen.dart';
import '../../features/profile/presentation/screens/privacy_policy_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../di/dependency_injection.dart';
import '../widgets/app_home.dart';
import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');
final cartCubit = getIt<CartCubit>();
final ordersCubit = getIt<OrdersCubit>();

final router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.signIn,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInScreen(),
          ),
    ),
    GoRoute(
      path: Routes.verifyOtp,
      builder: (context, state) {
        final email = state.uri.queryParameters['email']!;
        final otpKey = state.uri.queryParameters['otpKey']!;
        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: VerifyOtpScreen(email: email, otpKey: otpKey),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppHome(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: shellNavigatorAKey,
          routes: [
            GoRoute(
              path: Routes.home,
              name: Routes.home,
              pageBuilder:
                  (context, state) => NoTransitionPage(
                    child: BlocProvider(
                      create:
                          (context) =>
                              getIt<HomeCubit>()
                                ..getCategories()
                                ..getHome()
                                ..getCartProducts(),
                      child: const HomeScreen(),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorBKey,
          routes: [
            GoRoute(
              path: Routes.categories,
              name: Routes.categories,
              routes: [
                GoRoute(
                  path: Routes.categoryProducts,
                  routes: [
                    GoRoute(
                      path: Routes.productDetails,
                      builder:
                          (context, state) => BlocProvider(
                            create: (context) => getIt<CategoriesCubit>(),
                            child: ProductScreen(
                              product: state.extra as Product,
                            ),
                          ),
                    ),
                  ],
                  builder: (context, state) {
                    final categoryId = int.parse(
                      state.uri.queryParameters['categoryId']!,
                    );
                    final categories = state.extra as List<Category>;
                    return BlocProvider(
                      create:
                          (context) =>
                              getIt<CategoriesCubit>()
                                ..getCategoryProducts(categoryId),
                      child: CategoryProductsScreen(
                        categoryId: categoryId,
                        categories: categories,
                      ),
                    );
                  },
                ),
              ],
              pageBuilder:
                  (context, state) => NoTransitionPage(
                    child: BlocProvider(
                      create:
                          (context) =>
                              getIt<CategoriesCubit>()..getCategories(),
                      child: const CategoriesScreen(),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: shellNavigatorCKey,
          routes: [
            GoRoute(
              path: Routes.cart,
              name: Routes.cart,
              builder: (context, state) {
                return BlocProvider.value(
                  value: cartCubit,
                  child: const CartScreen(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorDKey,
          routes: [
            GoRoute(
              path: Routes.orders,
              name: Routes.orders,
              pageBuilder:
                  (context, state) => NoTransitionPage(
                    child: BlocProvider.value(
                      value: ordersCubit,
                      child: const OrdersScreen(),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorEKey,
          routes: [
            GoRoute(
              path: Routes.profile,
              name: Routes.profile,
              pageBuilder:
                  (context, state) =>
                      const NoTransitionPage(child: ProfileScreen()),
              routes: [
                GoRoute(
                  path: Routes.account,
                  name: Routes.account,
                  pageBuilder:
                      (context, state) => NoTransitionPage(
                        child: BlocProvider(
                          create:
                              (context) =>
                                  getIt<ProfileCubit>()..getUserProfile(),
                          child: const AccountScreen(),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: Routes.orderDetails,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) =>
                    getIt<OrdersCubit>()..getOrderDetails(state.extra as int),
            child: const OrderDetailsScreen(),
          ),
    ),
    GoRoute(
      path: Routes.payment,
      builder:
          (context, state) =>
              PaymentWebView(bearerToken: state.extra as String),
    ),
    GoRoute(
      path: Routes.privacyPolicy,
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: Routes.orderTracking,
      builder: (context, state) {
        final url = state.extra as String;    // we’ll pass it as extra
        return OrderTrackingWebView(url: url);
      },
    ),
  ],
);
