import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.bkDarkColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
  static ThemeData lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.bkLightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
