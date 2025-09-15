import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared_pref_helper.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/toast_notifications.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../../domain/model/cart.dart';
import '../controller/cart_cubit.dart';
import '../controller/cart_state.dart';
import '../widgets/cart_bloc_consumer.dart';
import '../widgets/empty_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'السلة'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLoggedInUser)
              const EmptyCart()
            else ...[
              Expanded(
                child: CustomRefreshIndicator(
                  onRefresh: () async {
                    context.read<CartCubit>().getCartProducts();
                  },
                  child: const CartBlocConsumer(),
                ),
              ),
              _BottomCheckoutSection(),
            ],
          ],
        ),
      ),
    );
  }
}

class _BottomCheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen:
          (previous, current) =>
              current is GetCartProductsSuccess ||
              current is GetCartProductsLoading,
      builder: (context, state) {
        if (state is! GetCartProductsSuccess) {
          return const SizedBox.shrink();
        }

        if (state.products.isEmpty) {
          return const SizedBox.shrink();
        }

        final total = _calculateTotal(state.products);
        final totalItems = _calculateTotalItems(state.products);

        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.black.withAlpha(10),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الإجمالي', style: TextStyles.font16BlackBold),
                  Text(
                    'QAR ${total.toStringAsFixed(2)}',
                    style: TextStyles.font18BlueBold,
                  ),
                ],
              ),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('العدد الإجمالي', style: TextStyles.font14GreyRegular),
                  Text('$totalItems منتج', style: TextStyles.font14GreyRegular),
                ],
              ),
              verticalSpace(16),
              AppTextButton(
                onPressed: () {
                  _handleCheckout(context);
                },
                buttonText: 'تأكيد الطلب',
              ),
            ],
          ),
        );
      },
    );
  }

  double _calculateTotal(List<Cart> cartItems) {
    return cartItems.fold(0, (sum, item) {
      final product = item.product;
      final price =
          double.tryParse(product?.discountedPrice ?? '') ??
          product?.price ??
          0;
      return sum + ((price as num) * (item.qty ?? 1));
    });
  }

  int _calculateTotalItems(List<Cart> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + (item.qty ?? 1));
  }

  Future<void> _handleCheckout(BuildContext context) async {
    String? userToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    if (!context.mounted) return;
    final result = await context.push(
      Uri(path: Routes.payment).toString(),
      extra: userToken,
    );
    if (!context.mounted) return;
    context.read<CartCubit>().getCartProducts();
    if (result == true) {
      ToastNotifications.toastSuccess(
        context,
        'مبروك!',
        'تم إتمام الطلب بنجاح',
      );
      context.go(Routes.orders);
    }
  }
}
