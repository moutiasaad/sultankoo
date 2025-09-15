import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../domain/model/category.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({
    super.key,
    required this.category,
    required this.categories,
  });

  final Category category;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.push(
            Uri(
              path: '${Routes.categories}/${Routes.categoryProducts}',
              queryParameters: {'categoryId': category.id.toString()},
            ).toString(),
            extra: categories,
          ),
      child: CachedNetworkImageWidget(
        height: 100.h,
        width: 100.w,
        imageUrl: '${category.img}',
      ),
    );
  }
}
