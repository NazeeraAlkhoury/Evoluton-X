import 'package:evoluton_x/features/player/domain/entities/player.dart';
import 'package:evoluton_x/features/player/presentation/widgets/custom_player_info_card.dart';
import 'package:flutter/material.dart';

class PlayerCardsListView extends StatelessWidget {
  final List<Player> suggestedPlayers;
  const PlayerCardsListView({
    super.key,
    required this.suggestedPlayers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestedPlayers.length,
        itemBuilder: (context, index) => CustomPlayerInfoCard(
          player: suggestedPlayers[index],
        ),
      ),
    );
  }
}
