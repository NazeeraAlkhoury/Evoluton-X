import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:flutter/material.dart';

class CustomPlayerProfileRow extends StatelessWidget {
  const CustomPlayerProfileRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 60),
      child: Column(
        children: [
          Row(
            children: [
              const CustomFlagOrClubAvatar(
                imagePath: 'assets/images/idiol_image.png',
                radius: 22,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Carlo ancelotti',
                        style: AppTextStyles.styleRegular14(context),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 10),
                            child: Text(
                              '9',
                              style: AppTextStyles.styleRegular12(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 10),
                            child: Text(
                              '25 y',
                              style: AppTextStyles.styleRegular12(context),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.only(end: 10),
                            child: CustomFlagOrClubAvatar(
                              imagePath: 'assets/images/flag.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 10),
                            child: Text(
                              'FRA',
                              style: AppTextStyles.styleRegular12(context),
                            ),
                          ),
                        ],
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
