import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_player_attrbuite_item.dart';
import 'package:flutter/material.dart';

class CustomPlayerInfoCard extends StatelessWidget {
  const CustomPlayerInfoCard({
    super.key,
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
                  child: Image.asset(
                    'assets/images/player.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    //height: 67,
                  ),
                ),
              ),
              Text(
                'club name',
                style: AppTextStyles.styleRegular9(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Player name',
                style: AppTextStyles.styleSemiBold10(context),
              ),
              const Divider(
                thickness: 1,
                color: AppColors.darkGreyColor,
                height: 9,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 2),
                      child: CustomPlayerAttributeItem(
                          label: AppStrings.pos, value: 'ST'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 2),
                      child: CustomPlayerAttributeItem(
                          label: AppStrings.age, value: '23'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 2),
                      child: CustomPlayerAttributeItem(
                          label: AppStrings.height, value: '183'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 2),
                      child: CustomPlayerAttributeItem(
                        label: AppStrings.nation,
                        value: 'assets/images/flag.png',
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
