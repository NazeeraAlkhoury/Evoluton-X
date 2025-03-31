import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String errMessage;
  const CustomErrorMessage({
    super.key,
    required this.errMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.redColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.redColor,
              size: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                errMessage,
                style: AppTextStyles.styleSemiBold16(context).copyWith(
                  color: AppColors.redColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
