import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/toast_notifications.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../controllers/categories_cubit.dart';
import '../controllers/categories_state.dart';

class CategoriesBlocListener extends StatelessWidget {
  const CategoriesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
      listenWhen:
          (previous, current) =>
              current is AddCartProductLoading ||
              current is AddCartProductSuccess ||
              current is AddCartProductError,
      listener: (context, state) {
        switch (state) {
          case AddCartProductLoading():
            showCustomLoading(context);
          case AddCartProductSuccess():
            _setupSuccess(context);
          case AddCartProductError():
            _setupError(context, (state).error);
          default:
            const SizedBox.shrink();
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupSuccess(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
    ToastNotifications.toastSuccess(
      context,
      'تمت إضافة المنتج.',
      'تم إضافة المنتج إلى سلة التسوق.',
    );
  }

  void _setupError(BuildContext context, String? error) {
    Navigator.of(context, rootNavigator: true).pop();
    errorSnackbar(context, error);
  }
}
