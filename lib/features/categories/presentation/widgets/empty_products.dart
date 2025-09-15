import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';

class EmptyProducts extends StatelessWidget {
  const EmptyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(200),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.blue,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16.w),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedProductLoading,
              size: 22.w,
              color: ColorsManager.white,
            ),
          ),
          verticalSpace(16),
          Text(
            'لا توجد منتجات متاحة',
            style: TextStyles.font18BlackBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          Text(
            'يبدو أنه لا يوجد منتجات في هذا التصنيف حاليًا.',
            style: TextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
