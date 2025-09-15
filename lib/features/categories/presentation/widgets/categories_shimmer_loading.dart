import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24.w,
      mainAxisSpacing: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100.w,
                height: 100.w,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: const BoxDecoration(color: ColorsManager.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
