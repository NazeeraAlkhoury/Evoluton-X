import 'package:cached_network_image/cached_network_image.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/domain/entities/player.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_event.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_player_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPlayerInfoCard extends StatelessWidget {
  final Player player;
  const CustomPlayerInfoCard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DetailsBloc>().add(const ResetPlayerEvent());
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
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        player.imageUrl.isNotEmpty ? player.imageUrl[0] : '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
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
// PersistentNavBarNavigator.pushNewScreen(
//   context,
//   screen: PlayerCardView(),
//   withNavBar: true,
// );


