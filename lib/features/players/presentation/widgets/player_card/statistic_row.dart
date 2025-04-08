import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/domain/entities/player_item_input.dart';
import 'package:flutter/material.dart';

class StatisticRow extends StatelessWidget {
  final PlayerItemInput item;
  const StatisticRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item.title,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          item.value,
          style: AppTextStyles.styleRegular16(context),
        ),
      ],
    );
  }
}
