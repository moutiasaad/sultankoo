import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultankoo/core/utils/extensions.dart';
import 'package:sultankoo/core/widgets/cached_network_image.dart';
import 'package:sultankoo/features/categories/domain/repo/categories_repo.dart';
import 'package:sultankoo/features/categories/presentation/controllers/categories_cubit.dart';
import 'package:sultankoo/features/categories/presentation/widgets/sub_categories_list_view.dart';
import 'package:sultankoo/features/home/presentation/widgets/category_products_section.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/spacing.dart';
import '../../domain/model/home.dart';
import '../controllers/home_cubit.dart';
import '../controllers/home_state.dart';
import 'home_shimmer_loading.dart';

class HomeBlocConsumer extends StatelessWidget {
  const HomeBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is GetCategoriesLoading ||
              current is GetCategoriesSuccess ||
              current is GetCategoriesError ||
              current is GetHomeLoading ||
              current is GetHomeSuccess ||
              current is GetHomeError,
      builder: (context, state) {
        switch (state) {
          case GetHomeLoading():
          case GetCategoriesLoading():
            return const HomeShimmerLoading();
          case GetHomeSuccess():
            return _setupSuccess(state.home, context);
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

  Widget _setupSuccess(List<Home> home, BuildContext context) {
    final categories = context.read<HomeCubit>().categories;

    // ✅ Remove the crashing print, or make it safe:
    // final has465 = categories.any((e) => e.id == 465);
    // if (has465) debugPrint(categories.firstWhere((e) => e.id == 465).img);

    if (home.isEmpty) return const Text('No data');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...home.map((item) {
          final isBanner = item.type == 'banner';
          final categoryId = int.tryParse(item.value ?? '') ?? -1;
          final subCategories =
          categories.where((e) => e.catId == categoryId).toList();
          return Container(
            margin: EdgeInsets.only(
              bottom: 16.h,
              right: isBanner ? 0 : 16.w,
              left: isBanner ? 0 : 16.w,
            ),
            decoration: const BoxDecoration(color: ColorsManager.white),
            child: isBanner
            // ✅ Show banner as-is
                ? CachedNetworkImageWidget(imageUrl: item.value ?? '')
            // ✅ Guard against invalid categoryId
                : (categoryId <= 0)
                ? const SizedBox.shrink()
                : BlocProvider<CategoriesCubit>(
              create: (ctx) => CategoriesCubit(
                ctx.read<CategoriesRepo>(),   // requires a RepositoryProvider<CategoriesRepo> above
              )..getCategoryProducts(categoryId),
              child:
              SubCategoriesListView(categories: subCategories),
            ),
          );
        }),
        verticalSpace(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'مميزات المتجر',
            style: TextStyles.font20BlackBold,
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          height: 140.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16.w),
            children: [
              _buildBenefitCard(icon: Icons.card_giftcard, title: 'توصيل فوري'),
              horizontalSpace(12),
              _buildBenefitCard(icon: Icons.security, title: 'دفع آمن'),
              horizontalSpace(12),
              _buildBenefitCard(icon: Icons.support_agent, title: 'دعم فني 24/7'),
            ],
          ),
        ),
      ],
    );
  }



  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }

  Widget _buildBenefitCard({required IconData icon, required String title}) {
    return Container(
      width: 130.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32.w, color: ColorsManager.blue),
          verticalSpace(16),
          Text(
            title,
            style: TextStyles.font14BlackRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
