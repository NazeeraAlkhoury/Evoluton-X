import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.7,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(
          AppStrings.clubsFilter,
          style: AppTextStyles.styleRegular12(context).copyWith(
            color: AppColors.buttonTextColor,
          ),
        ),
        iconAlignment: IconAlignment.end,
        icon: SvgPicture.asset(
          AppIconAssets.filter,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
