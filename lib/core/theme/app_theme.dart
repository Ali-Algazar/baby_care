import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,

    fontFamily: Constants.kfontFamily, // Set the default font family
    scaffoldBackgroundColor: AppColors.bG, // Scaffold background color
    // Define the color scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.success,
    ),

    // Text form field theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true, // Enable filled background
      fillColor: AppColors.bG, // Background color for text fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Constants.ktextFieldRadius.toDouble(),
        ),
        borderSide: BorderSide(color: AppColors.border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Constants.ktextFieldRadius.toDouble(),
        ),
        borderSide: BorderSide(color: AppColors.border, width: 1),
      ),

      // Padding inside the text fields
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
  );
}
