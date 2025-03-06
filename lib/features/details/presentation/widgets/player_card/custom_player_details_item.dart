import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPlayerDetailsItem extends StatelessWidget {
  const CustomPlayerDetailsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.favLeg,
          style: AppTextStyles.styleRegular16(context)
              .copyWith(color: AppColors.darkGreyColor),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.darkGreyColor,
          height: 5,
        ),
        Text(
          'ST',
          style: AppTextStyles.styleRegular16(context),
        ),
      ],
    );
  }
}
