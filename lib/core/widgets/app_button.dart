import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const AppButton({
    super.key,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: AppTextStyles.styleSemiBold16(context).copyWith(
            color: AppColors.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
