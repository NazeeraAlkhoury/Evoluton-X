import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPlayerAttributeItem extends StatelessWidget {
  final String label;
  final String value;
  const CustomPlayerAttributeItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: AppTextStyles.styleBold9(context),
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.darkGreyColor,
          height: 5,
        ),
        if (label != AppStrings.nation) ...[
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyles.styleRegular9(context),
            ),
          ),
        ] else ...[
          Flexible(
            child: CircleAvatar(
              radius: 6.5,
              child: Image.asset(
                value,
                fit: BoxFit.scaleDown,
              ),
            ),
          )
        ]
      ],
    );
  }
}
