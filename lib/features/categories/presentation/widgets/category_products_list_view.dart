import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/model/product.dart';
import 'category_products_list_view_item.dart';

class CategoryProductsListView extends StatelessWidget {
  const CategoryProductsListView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: products.length,
      crossAxisCount: 2,
      crossAxisSpacing: 16.h,
      mainAxisSpacing: 16.w,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemBuilder: (context, index) {
        final product = products[index];
        return CategoryProductsListViewItem(product: product);
      },
    );
  }
}
