import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/domain/entities/player_item_input.dart';
import 'package:flutter/material.dart';

class CustomPlayerDetailsItem extends StatelessWidget {
  final PlayerItemInput playerDetailsItemInput;
  const CustomPlayerDetailsItem({
    super.key,
    required this.playerDetailsItemInput,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Text(
            playerDetailsItemInput.title,
            style: AppTextStyles.styleRegular16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.darkGreyColor,
          height: 5,
        ),
        FittedBox(
          child: Text(
            playerDetailsItemInput.value,
            style: AppTextStyles.styleRegular16(context),
          ),
        ),
      ],
    );
  }
}
