import 'package:cached_network_image/cached_network_image.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/player/domain/entities/club.dart';
import 'package:flutter/material.dart';

class CustomClub extends StatelessWidget {
  final Club club;
  const CustomClub({
    super.key,
    required this.club,
  });
  // aspectRatio: 1.12 / 1.03,
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.clubCard);
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: const ClubCardView(),
        //   withNavBar: true,
        // );
      },
      child: AspectRatio(
        aspectRatio: 1.12 / 1.03,
        child: Card(
          color: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: club.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Image.asset(
                  //   'assets/images/club.png',
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                getLastWordFromUrl(club.nation!),
                                style: AppTextStyles.styleRegular14(context)
                                    .copyWith(
                                  color: AppColors.offWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CustomFlagOrClubAvatar(
                              imagePath: club.nation!,
                              radius: 10,
                            ),
                            //  CircleAvatar(
                            //   radius: 10,
                            //   child: Image.asset(
                            //     'assets/images/flag.png',
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            club.name,
                            style:
                                AppTextStyles.styleSemiBold16(context).copyWith(
                              color: AppColors.offWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getLastWordFromUrl(String url) {
  List<String> parts = url.split('/');

  String lastPart = parts.last;

  String result = lastPart.split('.').first;

  return result;
}
