import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/model/category.dart';
import 'home_list_view_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: categories.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24.w,
      mainAxisSpacing: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        final category = categories[index];
        return HomeListViewItem(category: category, categories: categories);
      },
    );
  }
}
