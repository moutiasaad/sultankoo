import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../routing/app_router.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

final ValueNotifier<int> cartProductsCount = ValueNotifier<int>(0);

class AppHome extends StatelessWidget {
  const AppHome({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    if (index == 2) {
      cartCubit.getCartProducts();
    } else if (index == 3) {
      ordersCubit.getOrders(1, isRefreshing: true);
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Widget _buildIcon(int index, IconData icon) {
    return index == 2
        ? ValueListenableBuilder(
          valueListenable: cartProductsCount,
          builder: (context, count, _) {
            final iconWidget = HugeIcon(
              icon: icon,
              color:
                  navigationShell.currentIndex == index
                      ? ColorsManager.blue
                      : ColorsManager.grey,
              size: 22.w,
            );

            return count > 0
                ? Badge.count(count: count, child: iconWidget)
                : iconWidget;
          },
        )
        : HugeIcon(
          icon: icon,
          color:
              navigationShell.currentIndex == index
                  ? ColorsManager.blue
                  : ColorsManager.grey,
          size: 22.w,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 105.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsManager.blue,
          selectedLabelStyle: TextStyles.font12blueRegular,
          unselectedLabelStyle: TextStyles.font12ArgentRegular,
          unselectedItemColor: ColorsManager.grey,
          backgroundColor: ColorsManager.white,
          iconSize: 22.w,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildIcon(0, HugeIcons.strokeRoundedHome01),
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildIcon(1, HugeIcons.strokeRoundedMenu01),
              ),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildIcon(2, HugeIcons.strokeRoundedShoppingCart01),
              ),
              label: 'السلة',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildIcon(3, HugeIcons.strokeRoundedFile01),
              ),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildIcon(4, HugeIcons.strokeRoundedUserCircle),
              ),
              label: 'حسابي',
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            _goBranch(index);
          },
        ),
      ),
    );
  }
}
