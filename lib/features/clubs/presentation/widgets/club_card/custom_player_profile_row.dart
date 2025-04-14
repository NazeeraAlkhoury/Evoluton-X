import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';
import 'package:flutter/material.dart';

class CustomPlayerProfileRow extends StatelessWidget {
  final PlayerInTeam player;
  const CustomPlayerProfileRow({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 60),
      child: Column(
        children: [
          Row(
            children: [
              CustomFlagOrClubAvatar(
                imagePath: player.imageUrl[0],
                radius: 22,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          player.fullName,
                          style: AppTextStyles.styleRegular14(context),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Text(
                                player.age,
                                style: AppTextStyles.styleRegular12(context),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: CustomFlagOrClubAvatar(
                                imagePath: player.nation,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Text(
                                player.nationality,
                                style: AppTextStyles.styleRegular12(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.darkGreyColor,
          ),
        ],
      ),
    );
  }
}
