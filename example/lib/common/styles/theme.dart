import 'package:flutter/material.dart';

class AppTheme {
  static const String fontMontserrat = 'Montserrat';

  static const Color themeColor = Color(0xFFE73B26);

  static const Color secondaryColor = Colors.orange;

  static const Color darkThemeColor = Color.fromARGB(255, 4, 39, 156);

  /// 亮色主题样式
  static ThemeData light = ThemeData(
    useMaterial3: false,
    fontFamily: fontMontserrat,
    colorScheme: ColorScheme.fromSeed(
      seedColor: themeColor,
      primary: themeColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
      surface: const Color.fromARGB(255, 250, 250, 250),
      surfaceTint: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color.fromARGB(200, 0, 0, 0),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(200, 0, 0, 0),
      ),
    ),
  );

  /// 暗色主题样式
  static ThemeData dark = ThemeData(
    useMaterial3: false,
    fontFamily: fontMontserrat,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkThemeColor,
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 48, 48, 48),
      surfaceTint: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromARGB(255, 34, 34, 34),
    ),
  );
}
