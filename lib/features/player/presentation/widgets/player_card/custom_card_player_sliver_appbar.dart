import 'package:cached_network_image/cached_network_image.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/player/domain/entities/player.dart';
import 'package:flutter/material.dart';

class CustomCardPlayerSliverAppBar extends StatelessWidget {
  final Player player;
  const CustomCardPlayerSliverAppBar({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 80,
              ),
              Text(
                player.name,
                style: AppTextStyles.styleSemiBold20(context),
              ),
              const SizedBox(
                width: 50,
              ),
              CustomFlagOrClubAvatar(
                imagePath: player.nation,
                radius: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomFlagOrClubAvatar(
                imagePath: player.club.imageUrl,
                radius: 10,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        centerTitle: true,
        background: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: CachedNetworkImage(
              imageUrl: player.imageUrl[0],
              fit: BoxFit.cover,
              height: 280,
              width: double.infinity,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
      ),
      elevation: 0,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomBackButton(
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      // leadingWidth: 100,
    );
  }
}
