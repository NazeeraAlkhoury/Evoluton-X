import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatisticRow extends StatelessWidget {
  final String name;
  final String value;
  const StatisticRow({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: AppTextStyles.styleRegular16(context),
        ),
      ],
    );
  }
}
