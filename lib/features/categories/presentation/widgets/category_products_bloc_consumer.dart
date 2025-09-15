import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/error_snackbar.dart';
import '../../domain/model/product.dart';
import '../controllers/categories_cubit.dart';
import '../controllers/categories_state.dart';
import 'category_products_list_view.dart';
import 'empty_products.dart';
import 'products_shimmer_loading.dart';

class CategoryProductsBlocConsumer extends StatelessWidget {
  const CategoryProductsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is GetCategoryProductsLoading ||
              current is GetCategoryProductsSuccess ||
              current is GetCategoryProductsError,
      builder: (context, state) {
        switch (state) {
          case GetCategoryProductsLoading():
            return const ProductsShimmerLoading();
          case GetCategoryProductsSuccess():
            return _setupSuccess(state.products);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is GetCategoryProductsError,
      listener: (context, state) {
        switch (state) {
          case GetCategoryProductsError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text('المنتجات', style: TextStyles.font18BlackBold),
        ),
        products.isNotEmpty
            ? CategoryProductsListView(products: products)
            : const EmptyProducts(),
      ],
    );
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
