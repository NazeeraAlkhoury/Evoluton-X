import 'package:evoluton_x/features/player/domain/entities/player_item_input.dart';
import 'package:evoluton_x/features/player/presentation/widgets/player_card/custom_player_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerDetailsItemGridView extends StatelessWidget {
  final List<PlayerItemInput> playerDetailsItemInput;
  const PlayerDetailsItemGridView({
    super.key,
    required this.playerDetailsItemInput,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => SizedBox(
          height: 36,
          child: CustomPlayerDetailsItem(
            playerDetailsItemInput: playerDetailsItemInput[index],
          )),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 0,
      ),
    );
  }
}
