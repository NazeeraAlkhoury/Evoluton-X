import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_player_profile_row.dart';

import 'package:flutter/material.dart';

class CustomPlayerwithpredictionResult extends StatelessWidget {
  final PlayerInTeam player;
  const CustomPlayerwithpredictionResult({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomPlayerProfileRow(
            player: player,
          ),
        ),
        Text(
          '${player.predictionResult}',
          style: AppTextStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
