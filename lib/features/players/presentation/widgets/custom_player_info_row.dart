import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_player_attrbuite_item.dart';
import 'package:flutter/material.dart';

class CustomPlayerInfoRow extends StatelessWidget {
  final Player player;
  const CustomPlayerInfoRow({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: CustomPlayerAttributeItem(
              label: AppStrings.pos,
              value: player.positions.toString(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: CustomPlayerAttributeItem(
              label: AppStrings.age,
              value: player.age.toString(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: CustomPlayerAttributeItem(
                label: AppStrings.power, value: player.power.toString()),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: CustomPlayerAttributeItem(
              label: AppStrings.nation,
              value: player.nation,
            ),
          ),
        ),
      ],
    );
  }
}
