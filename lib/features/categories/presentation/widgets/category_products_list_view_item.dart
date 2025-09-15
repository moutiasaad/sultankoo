import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../domain/model/product.dart';
import '../controllers/categories_cubit.dart';

class CategoryProductsListViewItem extends StatelessWidget {
  const CategoryProductsListViewItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountedPrice != null &&
        product.discountedPrice != product.price.toString();

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap:
          () => context.push(
            Uri(
              path:
                  '${Routes.categories}/${Routes.categoryProducts}/${Routes.productDetails}',
            ).toString(),
            extra: product,
          ),

      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.black.withAlpha(10),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  child: CachedNetworkImageWidget(
                    imageUrl: product.primaryImage ?? '',
                    height: 120.h,
                    width: double.infinity,
                  ),
                ),
                if (hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.red,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text('خصم', style: TextStyles.font10WhiteBold),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      if (hasDiscount)
                        Text(
                          'QAR ${product.price?.toStringAsFixed(2)}',
                          style: TextStyles.font12GreyRegular.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      horizontalSpace(hasDiscount ? 4.w : 0),
                      Text(
                        hasDiscount
                            ? product.discountedPrice ?? ''
                            : 'QAR ${product.price?.toStringAsFixed(2)}',
                        style: TextStyles.font14BlueBold,
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  AppTextButton(
                    onPressed: () {
                      if (isLoggedInUser) {
                        context.read<CategoriesCubit>().addCartProduct(
                          product.id!,
                        );
                      } else {
                        context.go(Uri(path: Routes.signIn).toString());
                      }
                    },
                    buttonHeight: 36.h,
                    buttonText: 'إضافة للسلة',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
