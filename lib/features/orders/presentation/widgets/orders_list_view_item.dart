import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../domain/model/order.dart';

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({super.key, required this.order});

  final Order order;

  (String, Color) _getStatusInfo(int? status) {
    switch (status) {
      case 0:
        return ('بانتظار المراجعة', ColorsManager.orange);
      case 1:
        return ('مدفوع', ColorsManager.blue);
      case 2:
        return ('قيد التنفيذ', ColorsManager.yellow);
      case 3:
        return ('تم الشحن', ColorsManager.lightBlue);
      case 4:
        return ('مكتمل', ColorsManager.green);
      case 5:
        return ('ملغى', ColorsManager.red);
      default:
        return ('غير معروف', ColorsManager.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (statusText, statusColor) = _getStatusInfo(order.status);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'طلب #${order.id ?? 'غير متوفر'}',
                  style: TextStyles.font16BlackBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withAlpha(10),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  statusText,
                  style: TextStyles.font12BlackRegular.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  Text('التاريخ', style: TextStyles.font14GreyRegular),
                  Text(
                    order.formattedDate ?? 'غير متوفر',
                    style: TextStyles.font14BlackMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('الإجمالي', style: TextStyles.font14GreyRegular),
                  Text(
                    '${order.totalPrice?.toStringAsFixed(2) ?? '0.00'} ${order.currency ?? ''}',
                    style: TextStyles.font14BlackBold,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            'عدد المنتجات: ${order.items?.length ?? 0}',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(12),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 45.h,
              child: AppTextButton(
                onPressed:
                    () => context.push(
                      Uri(path: Routes.orderDetails).toString(),
                      extra: order.id,
                    ),
                buttonText: 'عرض التفاصيل',
                buttonWidth: 150.w,
                textStyle: TextStyles.font14WhiteBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
