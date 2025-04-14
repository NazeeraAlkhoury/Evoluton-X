import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/favorite/presentation/widgets/custom_image_with_fav.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_event.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_player_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavoritePlayerCard extends StatelessWidget {
  final Player player;
  const CustomFavoritePlayerCard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PlayerBloc>().add(const ResetPlayerEvent());
        Navigator.of(context).pushNamed(
          AppRoutes.playerCard,
          arguments: player,
        );
      },
      child: AspectRatio(
        aspectRatio: 1.01 / 1.06,
        child: Card(
          color: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CustomImageWithFav(player: player),
              ),
              Text(
                player.club.name,
                style: AppTextStyles.styleRegular9(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                player.name,
                style: AppTextStyles.styleSemiBold10(context),
              ),
              const Divider(
                thickness: 1,
                color: AppColors.darkGreyColor,
                height: 9,
              ),
              CustomPlayerInfoRow(
                player: player,
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
