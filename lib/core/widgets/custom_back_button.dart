import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? iconColor;
  final Color? textColor;
  const CustomBackButton({
    super.key,
    this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            color: iconColor ?? AppColors.blackColor,
          ),
          Text(
            AppStrings.back,
            style: GoogleFonts.lemonada(
              textStyle: AppTextStyles.styleRegular14(context)
                  .copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
