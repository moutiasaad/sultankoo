import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../domain/model/order_details.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderDetails order;

  const OrderDetailsView({super.key, required this.order});

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

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          _buildOrderSummaryCard(statusText, statusColor),
          _buildClientInfoCard(),
          _buildItemsList(context),
          _buildPaymentDetailsCard(),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryCard(String statusText, Color statusColor) {
    return Container(
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
              Text('ملخص الطلب', style: TextStyles.font16BlackBold),
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
          _buildDetailRow('رقم الطلب', order.orderNumber ?? 'غير متوفر'),
          _buildDetailRow('التاريخ', order.createdAt ?? 'غير متوفر'),
          _buildDetailRow(
            'الإجمالي',
            '${order.totalPrice?.toStringAsFixed(2) ?? '0.00'} ${order.currency ?? ''}',
          ),
          if (order.trackingNumber != null)
            _buildDetailRow('رقم التتبع', order.trackingNumber!),
        ],
      ),
    );
  }

  Widget _buildClientInfoCard() {
    return Container(
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
          Text('معلومات العميل', style: TextStyles.font16BlackBold),
          verticalSpace(12),
          _buildDetailRow('الاسم', order.client?.name ?? 'غير متوفر'),
          _buildDetailRow(
            'البريد الإلكتروني',
            order.client?.email ?? 'غير متوفر',
          ),
          _buildDetailRow(
            'رقم الهاتف',
            order.client?.phoneNumber ?? 'غير متوفر',
          ),
          if (order.addressDetail != null)
            _buildDetailRow('العنوان', order.addressDetail!),
        ],
      ),
    );
  }

  Widget _buildItemsList(BuildContext context) {
    return Container(
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
          Text(
            'المنتجات (${order.items?.length ?? 0})',
            style: TextStyles.font16BlackBold,
          ),
          verticalSpace(12),
          if (order.items != null && order.items!.isNotEmpty)
            ...order.items!.map(
              (item) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: item.product?.primaryImage ?? '',
                      width: 50.w,
                      height: 50.h,
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product?.name ?? 'غير متوفر',
                            style: TextStyles.font14BlackMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'الكمية: ${item.qty ?? 0}',
                            style: TextStyles.font12GreyRegular,
                          ),
                          verticalSpace(4),
                          if (item.product?.directCodes != null &&
                              item.product!.directCodes!.isNotEmpty)
                            ...item.product!.directCodes!.map(
                              (code) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: GestureDetector(
                                  onTap: () {
                                    if (code.code != null) {
                                      Clipboard.setData(
                                        ClipboardData(text: code.code!),
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('تم النسخ الكود'),
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'كود : ${code.code ?? ''}',
                                          style: TextStyles.font12GreyRegular,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      horizontalSpace(4),
                                      const Icon(Icons.copy, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    horizontalSpace(24),
                    Text(
                      '${item.product?.price?.toStringAsFixed(2) ?? '0.00'} ${order.currency ?? ''}',
                      style: TextStyles.font14BlackBold,
                    ),
                  ],
                ),
              ),
            )
          else
            Text(
              'لا توجد منتجات في هذا الطلب',
              style: TextStyles.font14GreyRegular,
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetailsCard() {
    return Container(
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
          Text('تفاصيل الدفع', style: TextStyles.font16BlackBold),
          verticalSpace(12),
          _buildDetailRow(
            'طريقة الدفع',
            order.paymentMethod?.name ?? 'غير متوفر',
          ),
          _buildDetailRow('الحالة', order.isPaid == 1 ? 'مدفوع' : 'غير مدفوع'),
          if (order.discountAmount != null && order.discountAmount! > 0)
            _buildDetailRow(
              'الخصم',
              '${order.discountAmount!.toStringAsFixed(2)} ${order.currency ?? ''}',
            ),
          _buildDetailRow(
            'الإجمالي',
            '${order.totalPrice?.toStringAsFixed(2) ?? '0.00'} ${order.currency ?? ''}',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.font14GreyRegular),
          Text(value, style: TextStyles.font14BlackMedium),
        ],
      ),
    );
  }
}
