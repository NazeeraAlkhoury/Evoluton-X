import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/player/presentation/widgets/filter_clubs/custom_filter_row.dart';
import 'package:flutter/material.dart';

class ClubsfilterAndSuggestionHeader extends StatelessWidget {
  const ClubsfilterAndSuggestionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.allClubs,
          style: AppTextStyles.styleSemiBold18(context).copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomFilterRow(),
        const SizedBox(
          height: 15,
        ),
        Text(
          AppStrings.suggest,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}
