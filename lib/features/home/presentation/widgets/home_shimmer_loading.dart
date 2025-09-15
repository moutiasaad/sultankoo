import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/spacing.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (_, __) => horizontalSpace(16),
            itemCount: 5,
            itemBuilder: (_, index) => const ShimmerMainCategoryItem(),
          ),
        ),
        verticalSpace(16),
        const ShimmerGridCategories(count: 6),
        verticalSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 120.w,
              height: 24.h,
              color: ColorsManager.white,
            ),
          ),
        ),
        verticalSpace(16),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16.w),
            itemCount: 3,
            separatorBuilder: (_, __) => horizontalSpace(12),
            itemBuilder: (_, index) => const ShimmerFeatureCard(),
          ),
        ),
      ],
    );
  }
}

class ShimmerMainCategoryItem extends StatelessWidget {
  const ShimmerMainCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}

class ShimmerGridCategories extends StatelessWidget {
  final int count;

  const ShimmerGridCategories({super.key, this.count = 6});

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24.w,
      mainAxisSpacing: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: count,
      itemBuilder: (context, index) {
        return const ShimmerCategoryItem();
      },
    );
  }
}

class ShimmerCategoryItem extends StatelessWidget {
  const ShimmerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}

class ShimmerFeatureCard extends StatelessWidget {
  const ShimmerFeatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 130.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 32.w, height: 32.w, color: ColorsManager.white),
            verticalSpace(16),
            Container(width: 80.w, height: 16.h, color: ColorsManager.white),
          ],
        ),
      ),
    );
  }
}
