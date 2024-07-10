import 'package:flutter/material.dart';

class AppTheme {
  static const String fontMontserrat = 'Montserrat';

  static const Color themeColor = Color.fromARGB(255, 11, 107, 47);

  static const Color darkThemeColor = Color.fromARGB(255, 27, 31, 139);

  /// 亮色主题样式
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: themeColor,
      brightness: Brightness.light,
    ),
    fontFamily: fontMontserrat,
    cardTheme: CardTheme(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  /// 暗色主题样式
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkThemeColor,
      brightness: Brightness.dark,
    ),
    fontFamily: fontMontserrat,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
