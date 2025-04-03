import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

void showCustomSuccessSnackBar(
    {required BuildContext context, required String successMessage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        successMessage,
        style: AppTextStyles.styleSemiBold16(context).copyWith(
          color: AppColors.buttonTextColor,
        ),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
  );
}
