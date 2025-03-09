import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:flutter/material.dart';

class CustomPlayersXg extends StatelessWidget {
  const CustomPlayersXg({
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
          '7.33 (4)',
          style: AppTextStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
