import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:flutter/material.dart';

class CustomCardClubSleverAppBar extends StatelessWidget {
  const CustomCardClubSleverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      elevation: 0,
      floating: false,
      pinned: true,
      titleTextStyle: AppTextStyles.styleRegular16(context),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomBackButton(
            onTap: () {},
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomFlagOrClubAvatar(
              imagePath: 'assets/images/flag.png',
              radius: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomFlagOrClubAvatar(
                  imagePath: 'assets/images/flag.png',
                ),
                // CircleAvatar(
                //   radius: 8,
                //   child: Image.asset(
                //     'assets/images/flag.png',
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Spain',
                    style: AppTextStyles.styleRegular14(context),
                  ),
                ),
              ],
            ),
          ],
        ),
        title: Text(
          'Real Madrid',
          style: AppTextStyles.styleRegular16(context),
        ),
        centerTitle: true,
      ),
    );
  }
}
