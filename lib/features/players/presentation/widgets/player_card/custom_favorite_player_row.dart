import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_bloc.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_event.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_state.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavoritePlayerRow extends StatelessWidget {
  const CustomFavoritePlayerRow({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          FavoriteBloc bloc = context.read<FavoriteBloc>();
          final isFavorite =
              bloc.playerIdToFavoriteIdMap.containsKey(player.id);
          final favoriteId = bloc.playerIdToFavoriteIdMap[player.id];

          return Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: RotationTransition(
                        turns: animation,
                        child: child,
                      ),
                    ),
                  );
                },
                child: IconButton(
                  key: ValueKey(isFavorite ? 'fav' : 'not_fav'),
                  onPressed: () {
                    isFavorite && favoriteId != null
                        ? bloc.add(RemovePlayerFromFavoritesEvent(
                            favoriteId: favoriteId))
                        : bloc.add(
                            AddPlayerToFavoritesEvent(playerId: player.id));
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Text(
                isFavorite ? AppStrings.remove : AppStrings.add,
                style: AppTextStyles.styleMedium15(context).copyWith(
                  color: AppColors.redColor,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
