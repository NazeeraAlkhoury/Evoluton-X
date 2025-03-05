import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilterDialogActionButton extends StatelessWidget {
  const CustomFilterDialogActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        onPressed: () {},
        child: Text(
          AppStrings.cancel,
          style: AppTextStyles.styleMedium12(context).copyWith(
            fontFamily: GoogleFonts.inder().fontFamily,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
