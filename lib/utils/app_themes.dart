import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
      backgroundColor: AppColors.whiteColor
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium20Black
    ),

  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.blackColor
    ),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium14White,
          headlineLarge: AppStyles.medium20White,
      ),
  );
}
