import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/spacing.dart';

class OrderDetailsShimmerLoading extends StatelessWidget {
  const OrderDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          _buildShimmerCard(
            children: [
              _buildShimmerHeader(),
              verticalSpace(12),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
            ],
          ),
          _buildShimmerCard(
            children: [
              _buildShimmerHeader(),
              verticalSpace(12),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
            ],
          ),
          _buildShimmerCard(
            children: [
              _buildShimmerHeader(),
              verticalSpace(12),
              _buildShimmerListItem(),
              _buildShimmerListItem(),
              _buildShimmerListItem(),
            ],
          ),
          _buildShimmerCard(
            children: [
              _buildShimmerHeader(),
              verticalSpace(12),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
              _buildShimmerDetailRow(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCard({required List<Widget> children}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.grey.withAlpha(20),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildShimmerHeader() {
    return Container(width: 120.w, height: 20.h, color: ColorsManager.white);
  }

  Widget _buildShimmerDetailRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 80.w, height: 14.h, color: ColorsManager.white),
          Container(width: 100.w, height: 14.h, color: ColorsManager.white),
        ],
      ),
    );
  }

  Widget _buildShimmerListItem() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  color: ColorsManager.white,
                ),
                verticalSpace(4),
                Container(
                  width: 60.w,
                  height: 12.h,
                  color: ColorsManager.white,
                ),
              ],
            ),
          ),
          Container(width: 80.w, height: 16.h, color: ColorsManager.white),
        ],
      ),
    );
  }
}
