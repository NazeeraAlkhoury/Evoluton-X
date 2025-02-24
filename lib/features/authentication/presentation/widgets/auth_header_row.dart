import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthHeaderRow extends StatelessWidget {
  final String title;
  const AuthHeaderRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            AppImageAssets.logo,
          ),
        ),
        const SizedBox(
          height: 120,
          child: VerticalDivider(
            color: AppColors.darkGreyColor,
            thickness: 1,
            width: 5,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title, style: AppTextStyles.styleSemiBold18(context)),
          ),
        ),
      ],
    );
  }
}
