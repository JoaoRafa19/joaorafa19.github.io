import 'package:flutter/material.dart';

class AppColors {
  static const Color headerBlack = Color(0xFF010409);
  static const Color bodyBlack = Color(0xFF0D1117);
  static const Color white = Color(0xFFE6EDF3);
  static const Color borderGrey = Color(0xFF30363D);
  static const Color lightGrey = Color(0xFF616872);
}

// App text Theme
class AppTheme extends Theme {
  const AppTheme({super.key, required super.data, required super.child});

  static const TextStyle header = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: AppColors.white,
  );
  static const TextStyle body = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextTheme textTheme = TextTheme(
    titleLarge: header,
    displayMedium: TextStyle(
        color: AppColors.lightGrey, fontSize: 20, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        color: AppColors.lightGrey, fontSize: 14, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(
        color: AppColors.lightGrey,
        fontSize: 20,
        fontWeight: FontWeight.w100,
        wordSpacing: 0.2),
    bodyLarge: body,
    bodyMedium: TextStyle(
        color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w400),
  );
}
