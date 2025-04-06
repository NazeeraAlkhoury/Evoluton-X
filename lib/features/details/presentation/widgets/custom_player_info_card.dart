import 'package:cached_network_image/cached_network_image.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/domain/entities/player.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_player_attrbuite_item.dart';
import 'package:flutter/material.dart';

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
        Navigator.of(context).pushNamed(AppRoutes.playerCard);
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: PlayerCardView(),
        //   withNavBar: true,
        // );
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
                    // placeholder: (context, url) =>
                    //     Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  //  Image.asset(

                  // 'assets/images/player.png',
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  //   //height: 67,
                  // ),
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
              Row(
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
                          label: AppStrings.power,
                          value: player.power.toString()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 2),
                      child: CustomPlayerAttributeItem(
                        label: AppStrings.nation,
                        value: player.nation,
                        //'assets/images/flag.png',
                      ),
                    ),
                  ),
                ],
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
