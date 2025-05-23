import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:flutter/material.dart';

class TeamPlayersList extends StatelessWidget {
  final List<PlayerInTeam> players;
  const TeamPlayersList({
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
        child: CustomPlayerProfileRow(
          player: players[index],
        ),
      ),
      itemCount: players.length,
    );
  }
}
