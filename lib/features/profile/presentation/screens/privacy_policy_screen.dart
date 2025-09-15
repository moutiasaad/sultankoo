import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/top_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'سياسة الخصوصية'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: ColorsManager.blue.withAlpha(10),
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.blue, width: 2),
                    ),
                    child: Icon(
                      Icons.privacy_tip_outlined,
                      size: 50.r,
                      color: ColorsManager.blue,
                    ),
                  ),
                  verticalSpace(16),
                  Text('خصوصيتك تهمنا', style: TextStyles.font24BlueBold),
                ],
              ),
            ),

            verticalSpace(24),

            _buildPolicySection(
              context,
              title: '1. المعلومات التي نجمعها',
              content:
                  'نقوم بجمع المعلومات التي تقدمها عند إنشاء حساب أو إجراء عمليات شراء أو التواصل مع الدعم. قد يشمل ذلك اسمك وبريدك الإلكتروني وتفاصيل الدفع وسجل المعاملات.',
            ),

            _buildPolicySection(
              context,
              title: '2. كيفية استخدامنا لبياناتك',
              content:
                  'يتم استخدام معلوماتك لمعالجة المعاملات وتقديم الدعم للعملاء وتحسين خدماتنا وإرسال إشعارات مهمة. نحن لا نبيع بياناتك الشخصية إلى أطراف ثالثة.',
            ),

            _buildPolicySection(
              context,
              title: '3. أمان البيانات',
              content:
                  'ننفذ تدابير أمان تتوافق مع معايير الصناعة بما في ذلك التشفير والخوادم الآمنة لحماية معلوماتك. تتم معالجة جميع معاملات الدفع من خلال مزودين متوافقين مع معايير PCI.',
            ),

            _buildPolicySection(
              context,
              title: '4. خدمات الطرف الثالث',
              content:
                  'قد نستخدم خدمات طرف ثالث موثوقة لمعالجة الدفع والتحليلات ودعم العملاء. لدى هؤلاء المزودين سياسات خصوصية خاصة بهم تحكم استخدام البيانات.',
            ),

            _buildPolicySection(
              context,
              title: '5. حقوقك',
              content:
                  'يمكنك طلب الوصول إلى بياناتك الشخصية أو تصحيحها أو حذفها..',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.font16BlueBold),
          verticalSpace(8),
          Text(content, style: TextStyles.font14BlackRegular),
        ],
      ),
    );
  }
}
