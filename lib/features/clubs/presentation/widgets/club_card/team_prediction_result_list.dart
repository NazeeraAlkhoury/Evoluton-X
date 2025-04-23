import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_players_with_prediction.dart';
import 'package:flutter/material.dart';

class TeamPredictionResultList extends StatelessWidget {
  final List<PlayerInTeam> players;
  const TeamPredictionResultList({
    super.key,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CustomPlayerwithpredictionResult(
          player: players[index],
        ),
      ),
      itemCount: players.length,
    );
  }
}
