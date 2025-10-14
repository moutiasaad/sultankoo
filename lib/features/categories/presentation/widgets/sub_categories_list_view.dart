import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../home/domain/model/category.dart';
import 'sub_categories_list_view_item.dart';

class SubCategoriesListView extends StatelessWidget {
  const SubCategoriesListView({
    super.key,
    required this.categories,
    required this.allCategories,
  });

  final List<Category> categories;
  final List<Category> allCategories;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 24.w,
      mainAxisSpacing: 16.h,
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        final category = categories[index];
        return SubCategoriesListViewItem(
          category: category,
          allCategories: allCategories,
        );
      },
    );
  }
}
