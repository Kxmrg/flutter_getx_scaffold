import 'package:flutter/material.dart';

class AppTheme {
  static const String Font_Montserrat = 'Montserrat';

  static const String Font_YuYang = 'YuYang';

  static const Color themeColor = Color(0xFFE73B26);

  static const Color secondaryColor = Colors.orange;

  static const Color darkThemeColor = Color(0xFF032896);

  /// 亮色主题样式
  static ThemeData light = ThemeData(
    useMaterial3: false,
    fontFamily: Font_Montserrat,
    colorScheme: ColorScheme.fromSeed(
      seedColor: themeColor,
      primary: themeColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
      surface: Colors.white,
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
    fontFamily: Font_Montserrat,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkThemeColor,
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 42, 42, 42),
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
