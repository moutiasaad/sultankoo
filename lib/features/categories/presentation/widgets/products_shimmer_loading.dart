import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/spacing.dart';

class ProductsShimmerLoading extends StatelessWidget {
  const ProductsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AlignedGridView.count(
        itemCount: 6,
        crossAxisCount: 2,
        crossAxisSpacing: 16.h,
        mainAxisSpacing: 16.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemBuilder: (context, index) {
          return Container(
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
                Container(
                  padding: EdgeInsets.all(8.w),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 120.h,
                      width: double.infinity,
                      color: ColorsManager.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16.h,
                          width: double.infinity,
                          color: ColorsManager.white,
                        ),
                        verticalSpace(8),
                        Container(
                          height: 14.h,
                          width: 80.w,
                          color: ColorsManager.white,
                        ),
                        verticalSpace(8),
                        Container(
                          height: 36.h,
                          width: double.infinity,
                          color: ColorsManager.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
