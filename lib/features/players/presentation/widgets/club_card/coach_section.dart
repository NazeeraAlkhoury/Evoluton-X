import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:flutter/material.dart';

class CoachSection extends StatelessWidget {
  const CoachSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.coach,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomPlayerProfileRow(),
      ],
    );
  }
}
