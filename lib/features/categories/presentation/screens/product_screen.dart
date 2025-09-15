import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../../domain/model/product.dart';
import '../controllers/categories_cubit.dart';
import '../widgets/categories_bloc_listener.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  void _addToCart(BuildContext context) {
    if (product.id != null) {
      context.read<CategoriesCubit>().addCartProduct(product.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountedPrice != null &&
        double.parse(product.discountedPrice!) < product.price!;

    return Scaffold(
      appBar: const TopAppBar(title: 'تفاصيل المنتج'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: product.primaryImage ?? '',
                      height: 250.h,
                      width: double.infinity,
                    ),
                    verticalSpace(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? '-',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpace(8.h),

                        Row(
                          children: [
                            if (hasDiscount)
                              Text(
                                'QAR ${product.price?.toStringAsFixed(2)}',
                                style: TextStyles.font16GreyRegular.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            horizontalSpace(8.w),
                            Text(
                              'QAR ${(hasDiscount ? product.discountedPrice : product.price)}',
                              style: TextStyles.font20BlueBold,
                            ),
                            if (hasDiscount) ...[
                              horizontalSpace(8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  'خصم',
                                  style: TextStyles.font12RedRegular,
                                ),
                              ),
                            ],
                          ],
                        ),
                        verticalSpace(16.h),
                        Text('الوصف', style: TextStyles.font18BlackBold),
                        Html(
                          data: product.description ?? 'لا يوجد وصف متاح',
                          style: {
                            'body': Style(
                              fontSize: FontSize(14.sp),
                              color: Colors.grey,
                              lineHeight: const LineHeight(1.5),
                            ),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: AppTextButton(
                onPressed: () {
                  if (isLoggedInUser) {
                    _addToCart(context);
                  } else {
                    context.go(Uri(path: Routes.signIn).toString());
                  }
                },
                buttonText: 'أضف إلى السلة',
              ),
            ),
            const CategoriesBlocListener(),
          ],
        ),
      ),
    );
  }
}
