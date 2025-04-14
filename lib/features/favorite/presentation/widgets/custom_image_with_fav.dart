import 'package:cached_network_image/cached_network_image.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:flutter/material.dart';

class CustomImageWithFav extends StatelessWidget {
  const CustomImageWithFav({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl: player.imageUrl.isNotEmpty ? player.imageUrl[0] : '',
            fit: BoxFit.cover,
            width: double.infinity,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 4, bottom: 2),
          child: Icon(
            Icons.favorite,
            color: AppColors.redColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
