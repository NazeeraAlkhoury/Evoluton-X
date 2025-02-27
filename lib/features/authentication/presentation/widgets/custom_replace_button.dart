import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomReplaceButton extends StatelessWidget {
  const CustomReplaceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
            elevation: 0,
          ),
          child: Text(
            AppStrings.replace,
            style: AppTextStyles.styleSemiBold16(context).copyWith(
              color: AppColors.primaryColor,
            ),
          )),
    );
  }
}
