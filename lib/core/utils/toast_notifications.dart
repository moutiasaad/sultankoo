import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../theming/styles.dart';

class ToastNotifications {
  static void _showToast(
    BuildContext context, {
    required ToastificationType type,
    required String title,
    required String description,
    Color? primaryColor,
  }) {
    toastification.show(
      context: context,
      type: type,
      primaryColor: primaryColor,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 2),
      showProgressBar: false,
      title: Text(title, style: TextStyles.font18WhiteBold),
      description: Text(description, style: TextStyles.font14WhiteMedium),
    );
  }

  static void toastSuccess(
    BuildContext context,
    String title,
    String description,
  ) {
    _showToast(
      context,
      type: ToastificationType.success,
      title: title,
      description: description,
      primaryColor: Colors.green,
    );
  }

  static void toastError(
    BuildContext context,
    String title,
    String description,
  ) {
    _showToast(
      context,
      type: ToastificationType.error,
      title: title,
      description: description,
    );
  }
}
