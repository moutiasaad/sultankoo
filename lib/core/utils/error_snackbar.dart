import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';
import 'spacing.dart';

void errorSnackbar(BuildContext context, String? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 4.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (error == null || error.isEmpty) ? 'حدث خطأ ما !' : error,
                style: TextStyles.font12WhiteMedium,
              ),
            ),
            horizontalSpace(8),
            Icon(Icons.error_outline, color: Colors.white, size: 24.h),
          ],
        ),
      ),
      backgroundColor: Colors.red[600],
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    ),
  );
}
