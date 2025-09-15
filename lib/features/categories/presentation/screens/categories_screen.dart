import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../../../home/domain/model/category.dart';
import '../controllers/categories_cubit.dart';
import '../widgets/categories_bloc_consumer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'التصنيفات'),
      body: SafeArea(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            await context.read<CategoriesCubit>().getCategories();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppTextField(
                    validator: (_) {},
                    hintText: 'إبحث عن تصنيف...',
                    suffixIcon: HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      size: 24.w,
                      color: ColorsManager.black,
                    ),
                    onChanged: (value) {
                      context.read<CategoriesCubit>().searchCategory(
                        value,
                        categories,
                      );
                    },
                  ),
                ),
                verticalSpace(16),
                CategoriesBlocConsumer(
                  onCategoriesLoaded: (categoriesList) {
                    if (categories.isEmpty) {
                      categories = categoriesList;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
