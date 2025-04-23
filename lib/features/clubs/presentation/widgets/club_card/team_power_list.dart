import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_player_with_power.dart';
import 'package:flutter/material.dart';

class TeamPowerList extends StatelessWidget {
  final List<PlayerInTeam> players;
  const TeamPowerList({
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
        child: CustomPlayerwithPower(
          player: players[index],
        ),
      ),
      itemCount: players.length,
    );
  }
}
