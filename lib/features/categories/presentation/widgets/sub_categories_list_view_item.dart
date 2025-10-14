import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../../home/domain/model/category.dart';

class SubCategoriesListViewItem extends StatelessWidget {
  const SubCategoriesListViewItem({
    super.key,
    required this.category,
    required this.allCategories,
  });

  final Category category;
  final List<Category> allCategories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.push(
            Uri(
              path: '${Routes.categories}/${Routes.categoryProducts}',
              queryParameters: {'categoryId': category.id.toString()},
            ).toString(),
            extra: allCategories,
          ),
      child: SizedBox(
        width: 80.w,
        height: 80.h,
        child: Column(
          children: [
            CachedNetworkImageWidget(
              imageUrl: '${category.img}',
              width: 80.w,
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}
