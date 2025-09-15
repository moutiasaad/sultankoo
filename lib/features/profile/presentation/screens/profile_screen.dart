import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared_pref_helper.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/top_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _rateApp() {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(
      appStoreId: 'id6744293057',
      microsoftStoreId: '...',
    );
  }

  void _shareApp(BuildContext context) {
    const googlePlayUrl =
        'https://play.google.com/store/apps/details?id=com.app.sultankoo';
    const appStoreUrl = 'https://apps.apple.com/app/sultankoo/id6744293057';

    const message = '''
      تحقق من هذا التطبيق الرائع:
      - Google Play: $googlePlayUrl
      - App Store: $appStoreUrl
      ''';

    final box = context.findRenderObject() as RenderBox?;
    Share.share(
      message,
      subject: 'توصية بالتطبيق',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
    context.push(Routes.privacyPolicy);
  }

  Future<void> _logout(BuildContext context) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, '');
    DioFactory.setTokenIntoHeaderAfterLogin('');
    setState(() {
      isLoggedInUser = false;
    });
  }

  Future<void> _navigateToSignIn(BuildContext context) async {
    await context.push(Routes.signIn);
    setState(() {});
  }

  Future<void> _navigateToAccount(BuildContext context) async {
    await context.push('${Routes.profile}/${Routes.account}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'حسابي'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLoggedInUser)
                _buildProfileOption(
                  icon: Icons.person,
                  title: 'حسابي',
                  onTap: () => _navigateToAccount(context),
                ),
              _buildProfileOption(
                icon: Icons.share,
                title: 'مشاركة التطبيق',
                onTap: () => _shareApp(context),
              ),
              _buildProfileOption(
                icon: Icons.star,
                title: 'قيم التطبيق',
                onTap: _rateApp,
              ),
              _buildProfileOption(
                icon: Icons.privacy_tip,
                title: 'سياسة الخصوصية',
                onTap: () => _navigateToPrivacyPolicy(context),
              ),
              if (isLoggedInUser)
                _buildProfileOption(
                  icon: Icons.logout,
                  title: 'تسجيل الخروج',
                  onTap: () => _logout(context),
                ),

              if (!isLoggedInUser) ...[
                verticalSpace(16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.blue.withAlpha(40),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'مرحبا زائرنا الكريم',
                        style: TextStyles.font18BlackMedium,
                      ),
                      verticalSpace(8),
                      Text(
                        'نحن سعداء بزيارتك لنا، إنضم إلينا الأن.',
                        textAlign: TextAlign.center,
                        style: TextStyles.font14BlackMedium,
                      ),
                      verticalSpace(16),
                      AppTextButton(
                        onPressed: () => _navigateToSignIn(context),
                        buttonWidth: 200.w,
                        buttonText: 'تسجيل الدخول',
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: ColorsManager.blue, size: 30.r),
      title: Text(title, style: TextStyles.font16BlackMedium),
      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.r,
        color: ColorsManager.black,
      ),
      onTap: onTap,
    );
  }
}
