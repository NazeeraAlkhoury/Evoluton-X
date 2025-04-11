import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomShowRow extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomShowRow({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppStrings.showAll,
            style: AppTextStyles.styleRegular14(context),
          ),
        ),
      ],
    );
  }
}
