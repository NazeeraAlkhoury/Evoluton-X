import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
  );
}
