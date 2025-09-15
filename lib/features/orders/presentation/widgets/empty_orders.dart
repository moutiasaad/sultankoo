import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.blue,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16.w),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedFile01,
              size: 22.w,
              color: ColorsManager.white,
            ),
          ),
          verticalSpace(8),
          Text('لا يوجد اي طلبات هنا بعد!', style: TextStyles.font18BlackBold),
          verticalSpace(8),
          Text(
            'ستعرض الطلبات هنا في حالة توفر اي منها',
            style: TextStyles.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
