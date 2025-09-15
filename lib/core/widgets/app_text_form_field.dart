import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool? readOnly;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final int maxLines;
  final Iterable<String>? autofillHints;
  final int? maxLength;
  final String? prefixText;
  final Function(String)? onChanged;
  const AppTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.backgroundColor,
    this.keyboardType,
    this.focusNode,
    this.autofillHints,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.maxLength,
    this.prefixText,
    this.controller,
    this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.white,
        isDense: true,
        errorStyle: TextStyles.font10RedRegular,
        prefixText: prefixText,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: hintStyle ?? TextStyles.font14BlackRegular,
        hintText: hintText,
        prefixIcon:
            prefixIcon != null
                ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Icon(
                    prefixIcon!,
                    size: 22.r,
                    color: ColorsManager.grey,
                  ),
                )
                : null,
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: suffixIcon,
                )
                : null,
      ),
      obscureText: isObscureText ?? false,
      keyboardType: keyboardType,
      style: TextStyles.font14BlackRegular,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
