import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFFE51D2A),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFE51D2A),
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFFf1f4f6),
      onBackground: Colors.black,
      surface: Color(0xFF2A576E),
      onSurface: Color(0xFF9AB0BB),
    ),
    dividerColor: const Color(0xFFe2e6ef),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll(Color(0xFFE51D2A)),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 35.spMax,
        fontWeight: FontWeight.w600,
      ),
      displayLarge: TextStyle(
        fontSize: 22.spMax,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 14.spMax,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.spMax,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.spMax,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 8.spMax,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16.spMax,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.spMax,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
