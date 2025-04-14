import 'package:evoluton_x/features/favorite/domain/entities/favorite_item_data.dart';
import 'package:evoluton_x/features/favorite/presentation/widgets/custom_favorite_player_card.dart';
import 'package:flutter/material.dart';

class FavoritePlayersGridView extends StatelessWidget {
  final List<FavoriteItemData> player;
  const FavoritePlayersGridView({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: player.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) =>
          CustomFavoritePlayerCard(player: player[index].player),
    );
  }
}
