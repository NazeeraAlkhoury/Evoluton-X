import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSkipButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomSkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: SizedBox(
        height: 27.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: AppColors.deepSkyBlueColor,
                width: 2,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.styleSemiBold10(context).copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
