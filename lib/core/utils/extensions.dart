import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}
