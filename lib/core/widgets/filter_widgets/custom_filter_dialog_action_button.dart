import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilterDialogActionButton extends StatelessWidget {
  final String textButton;
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;
  const CustomFilterDialogActionButton({
    super.key,
    required this.textButton,
    this.color,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ?? Colors.grey[200],
          disabledBackgroundColor: AppColors.darkGreyColor.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: AppTextStyles.styleMedium12(context).copyWith(
            fontFamily: GoogleFonts.inder().fontFamily,
            color: textColor ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
