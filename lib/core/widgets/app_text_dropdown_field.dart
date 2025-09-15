import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextDropdownField extends StatefulWidget {
  const AppTextDropdownField({
    super.key,
    required this.initialValue,
    required this.dropdownList,
    required this.onValueChanged,
    required this.validator,
    this.backgroundColor = ColorsManager.white,
    this.suffixIcon,
    this.readOnly,
  });

  final String? initialValue;
  final List<String> dropdownList;
  final ValueChanged<String?> onValueChanged;
  final Function(String?) validator;
  final Color backgroundColor;
  final Widget? suffixIcon;
  final bool? readOnly;

  @override
  State<AppTextDropdownField> createState() => _AppTextDropdownFieldState();
}

class _AppTextDropdownFieldState extends State<AppTextDropdownField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      isDense: false,
      itemHeight: 61.h,
      validator: (value) {
        return widget.validator(value);
      },
      dropdownColor: ColorsManager.lightGrey,
      elevation: 4,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        border: const OutlineInputBorder(),
        filled: true,
        errorStyle: TextStyles.font10RedRegular,
        fillColor: ColorsManager.lightGrey,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 3.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.blue),
          borderRadius: BorderRadius.circular(40.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(40.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
          borderRadius: BorderRadius.circular(40.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      items:
          widget.dropdownList.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: TextStyles.font14BlackRegular),
            );
          }).toList(),
      onChanged:
          widget.readOnly ?? false
              ? null
              : (newValue) {
                setState(() {
                  _selectedValue = newValue;
                  widget.onValueChanged(newValue);
                });
              },
    );
  }
}
