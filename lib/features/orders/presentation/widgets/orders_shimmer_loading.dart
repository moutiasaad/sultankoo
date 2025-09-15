import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/spacing.dart';

class OrdersShimmerLoading extends StatelessWidget {
  const OrdersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.white,
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
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 16.h,
                      color: ColorsManager.white,
                    ),
                    Container(
                      width: 80.w,
                      height: 24.h,
                      color: ColorsManager.white,
                    ),
                  ],
                ),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60.w,
                          height: 14.h,
                          color: ColorsManager.white,
                        ),
                        verticalSpace(4),
                        Container(
                          width: 100.w,
                          height: 14.h,
                          color: ColorsManager.white,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 60.w,
                          height: 14.h,
                          color: ColorsManager.white,
                        ),
                        verticalSpace(4),
                        Container(
                          width: 80.w,
                          height: 14.h,
                          color: ColorsManager.white,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(12),
                Container(
                  width: 120.w,
                  height: 14.h,
                  color: ColorsManager.white,
                ),
                verticalSpace(12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 120.w,
                    height: 36.h,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
