import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primary,
    textTheme: AppTypography.textTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundLight,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primary,
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.textWhite,
      displayColor: AppColors.textWhite,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: AppColors.textWhite),
    ),
  );
}
