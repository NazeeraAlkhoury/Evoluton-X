import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blackColor,
          ),
          Text(
            AppStrings.back,
            style: GoogleFonts.lemonada(
              textStyle: AppTextStyles.styleRegular14(context),
            ),
          ),
        ],
      ),
    );
  }
}
