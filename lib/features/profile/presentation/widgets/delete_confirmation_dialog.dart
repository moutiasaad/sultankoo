import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'هل انت متأكد من رغبتك في حذف الحساب؟',
                    style: TextStyles.font16BlackSemiBold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: ColorsManager.blue,
                    size: 30.h,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          verticalSpace(12),
          Text(
            'سيتم حذف الحساب نهائياً بعد 30 يوم وحذف جميع معلوماتك، خلال هذه المدة يمكنك استرجاع حسابك واستعادة بياناتك',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(24),
          AppTextButton(
            onPressed: () => Navigator.pop(context, false),
            buttonText: 'لا، لا تقم بحذفه',
          ),
          verticalSpace(12),
          AppTextButton(
            onPressed: () => Navigator.pop(context, true),
            buttonText: 'نعم، انا متأكد',
            backgroundColor: Colors.transparent,
            textStyle: TextStyles.font14RedSemiBold,
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: const BorderSide(color: ColorsManager.red),
              ),
            ),
            overlayColor: ColorsManager.red.withAlpha(10),
          ),
        ],
      ),
    );
  }
}
