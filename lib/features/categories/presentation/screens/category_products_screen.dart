import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultankoo/features/home/presentation/widgets/category_products_section.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../../../home/domain/model/category.dart';
import '../widgets/categories_bloc_listener.dart';
import '../widgets/category_products_bloc_consumer.dart';
import '../widgets/sub_categories_list_view.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    super.key,
    required this.categories,
    required this.categoryId,
  });

  final int categoryId;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'المنتجات'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: CategoryProductsSection(
            categoryId: categoryId,
            categories: categories,           // same list you already pass
            padding: EdgeInsets.zero,         // outer padding already applied
          ),
        ),
      ),
    );
  }
}