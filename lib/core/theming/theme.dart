import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

abstract class ThemeManager {
  static ThemeData getAppLightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorsManager.background,
      primaryColor: ColorsManager.blue,
      fontFamily: 'Cairo',
      chipTheme: const ChipThemeData(shape: StadiumBorder()),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.blue,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorsManager.blue,
        selectionColor: ColorsManager.blue,
        selectionHandleColor: ColorsManager.blue,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            ColorsManager.blue.withAlpha(10),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        elevation: 0,
        shape: CircleBorder(),
      ),
      appBarTheme: const AppBarTheme(
        color: ColorsManager.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
