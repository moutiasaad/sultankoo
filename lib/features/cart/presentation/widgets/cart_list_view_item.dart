import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../domain/model/cart.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.cart,
    required this.onDeleteProduct,
    required this.onAddProduct,
    required this.onDecreaseProduct,
  });

  final Cart cart;
  final VoidCallback onDeleteProduct;
  final VoidCallback onAddProduct;
  final VoidCallback onDecreaseProduct;

  @override
  Widget build(BuildContext context) {
    final product = cart.product;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.black.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImageWidget(
                  imageUrl: product?.primaryImage ?? '',
                  width: 80.w,
                  height: 80.h,
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product?.name ?? '-',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Html(
                        data: product?.description ?? '-',
                        shrinkWrap: true,
                        style: {
                          'body': Style(
                            fontSize: FontSize(12.sp),
                            color: Colors.grey[600],
                            lineHeight: const LineHeight(1.5),
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        },
                      ),

                      Row(
                        children: [
                          Text(
                            'QAR ${product?.discountedPrice ?? product?.price?.toStringAsFixed(2) ?? '0.00'}',
                            style: TextStyles.font16BlueBold,
                          ),

                          if (product?.discountedPrice != null) ...[
                            horizontalSpace(8),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                'QAR ${product?.price?.toStringAsFixed(2)}',
                                style: TextStyles.font12GreyRegular.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.h, thickness: 1, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, size: 18.r),
                        onPressed: () {
                          if (cart.qty != null) {
                            if (cart.qty! > 1) {
                              onDecreaseProduct();
                            } else {
                              onDeleteProduct();
                            }
                          }
                        },
                      ),
                      horizontalSpace(8),
                      Text('${cart.qty}', style: TextStyles.font14BlackMedium),
                      horizontalSpace(8),
                      IconButton(
                        icon: Icon(Icons.add, size: 18.r),
                        onPressed: onAddProduct,
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 18.r,
                    color: ColorsManager.red,
                  ),
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(
                      ColorsManager.red.withAlpha(10),
                    ),
                  ),
                  label: Text('حذف', style: TextStyles.font14RedRegular),
                  onPressed: onDeleteProduct,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
