import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
    primaryColor: ColorConstants.teal,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorConstants.teal,
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
    fontFamily: FontFamily.poppins,
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll(
        ColorConstants.teal,
      ),
    ),

    // scrollbarTheme: ScrollbarThemeData(
    //   trackColor: MaterialStatePropertyAll(
    //     Colors.white.withOpacity(0.3),
    //   ),
    // ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 35.spMin,
        fontWeight: FontWeight.w600,
        height: 1.3.wMax,
      ),
      displayLarge: TextStyle(
        fontSize: 22.spMin,
        fontWeight: FontWeight.bold,
        height: 1.3.wMax,
      ),
      displaySmall: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.bold,
        height: 1.3.wMax,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w400,
        height: 1.3.wMax,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w400,
        height: 1.3.wMax,
      ),
      bodySmall: TextStyle(
        fontSize: 8.spMin,
        fontWeight: FontWeight.w400,
        height: 1.3.wMax,
      ),
      titleMedium: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w400,
        height: 1.3.wMax,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.spMin,
        fontWeight: FontWeight.w500,
        height: 1.3.wMax,
      ),
    ),
  );
}
