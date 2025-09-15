import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final WidgetStateProperty<OutlinedBorder?>? shape;
  final Color? overlayColor;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.textStyle,
    this.shape,
    this.overlayColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape:
            shape ??
            WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
              ),
            ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.blue,
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 54.h),
        ),
        overlayColor: WidgetStatePropertyAll(
          overlayColor ?? ColorsManager.blue.withAlpha(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: textStyle ?? TextStyles.font16WhiteBold),
    );
  }
}
