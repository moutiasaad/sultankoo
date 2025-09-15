import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../home/domain/model/category.dart';
import '../controllers/categories_cubit.dart';
import '../controllers/categories_state.dart';
import 'categories_list_view.dart';
import 'categories_shimmer_loading.dart';

class CategoriesBlocConsumer extends StatelessWidget {
  const CategoriesBlocConsumer({super.key, this.onCategoriesLoaded});

  final Function(List<Category>)? onCategoriesLoaded;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is GetCategoriesLoading ||
              current is GetCategoriesSuccess ||
              current is GetCategoriesError,
      builder: (context, state) {
        switch (state) {
          case GetCategoriesLoading():
            return const CategoriesShimmerLoading();
          case GetCategoriesSuccess():
            return _setupSuccess(context, state.categories);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is GetCategoriesError,
      listener: (context, state) {
        switch (state) {
          case GetCategoriesError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(BuildContext context, List<Category> categories) {
    if (onCategoriesLoaded != null) {
      onCategoriesLoaded!(categories);
    }
    return categories.isNotEmpty
        ? CategoriesListView(categories: categories)
        : const SizedBox.shrink();
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
