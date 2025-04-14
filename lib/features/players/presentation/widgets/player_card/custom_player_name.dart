import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPlayerName extends StatelessWidget {
  const CustomPlayerName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.primaryColor,
      ),
      child: Text(
        name,
        style: AppTextStyles.styleSemiBold20(context).copyWith(
          color: AppColors.buttonTextColor,
        ),
      ),
    );
  }
}
