// lib/features/categories/presentation/widgets/category_products_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultankoo/features/categories/presentation/widgets/categories_bloc_listener.dart';
import 'package:sultankoo/features/categories/presentation/widgets/category_products_bloc_consumer.dart';
import 'package:sultankoo/features/categories/presentation/widgets/sub_categories_list_view.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../home/domain/model/category.dart' as domain;


class CategoryProductsSection extends StatelessWidget {
  final int categoryId;
  final List<domain.Category> categories;
  final EdgeInsetsGeometry? padding;

  const CategoryProductsSection({
    super.key,
    required this.categoryId,
    required this.categories,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final subCategories =
    categories.where((e) => e.catId == categoryId).toList();

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subCategories.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text('الأقسام', style: TextStyles.font18BlackBold),
          ),
          verticalSpace(16),
          SubCategoriesListView(
            categories: subCategories,
            allCategories: categories,
          ),
          verticalSpace(24),
        ],
        const CategoryProductsBlocConsumer(),
        const CategoriesBlocListener(),
      ],
    );

    return padding == null ? content : Padding(padding: padding!, child: content);
  }
}
