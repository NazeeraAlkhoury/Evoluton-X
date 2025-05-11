import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_player_info_card.dart';
import 'package:flutter/material.dart';

class ResultSearchFilterGridView extends StatelessWidget {
  final List<Player> player;
  const ResultSearchFilterGridView({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: player.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) => CustomPlayerInfoCard(
        player: player[index],
      ),
    );
  }
}
