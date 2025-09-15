import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../home/domain/model/category.dart';
import 'categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24.w,
      mainAxisSpacing: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoriesListViewItem(
          category: category,
          categories: categories,
        );
      },
    );
  }
}
