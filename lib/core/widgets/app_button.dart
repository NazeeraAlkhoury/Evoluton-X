import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  final double? widthButton;
  final double? hieghtButton;
  const AppButton({
    super.key,
    required this.textButton,
    this.onPressed,
    this.widthButton,
    this.hieghtButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieghtButton ?? 44,
      width: widthButton,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.primaryColor,
          disabledBackgroundColor: AppColors.primaryColor.withOpacity(.5),
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
