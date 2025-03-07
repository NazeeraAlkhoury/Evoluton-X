import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilterButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? color;
  final bool isOpacity;
  final double? width;
  const CustomFilterButton({
    super.key,
    this.onPressed,
    this.color,
    required this.label,
    this.isOpacity = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.7,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          label,
          style: AppTextStyles.styleRegular12(context).copyWith(
            color: AppColors.buttonTextColor,
          ),
        ),
        iconAlignment: IconAlignment.end,
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Opacity(
            opacity: isOpacity ? 1.0 : 0.2,
            child: SvgPicture.asset(
              AppIconAssets.filter,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.darkGreyColor,
          disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
