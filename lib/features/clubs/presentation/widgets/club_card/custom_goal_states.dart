import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:flutter/material.dart';

class CustomGoalsStates extends StatelessWidget {
  const CustomGoalsStates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomPlayerProfileRow(),
        ),
        Text(
          '5',
          style: AppTextStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
