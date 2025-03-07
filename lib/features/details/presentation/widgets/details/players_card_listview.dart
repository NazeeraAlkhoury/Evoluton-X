import 'package:evoluton_x/features/details/presentation/widgets/custom_player_info_card.dart';
import 'package:flutter/material.dart';

class PlayerCardsListView extends StatelessWidget {
  const PlayerCardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => const CustomPlayerInfoCard(),
      ),
    );
  }
}
