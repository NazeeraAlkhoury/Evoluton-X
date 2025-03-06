import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/statistic_row.dart';
import 'package:flutter/material.dart';

class StatisticTabBarView extends StatelessWidget {
  const StatisticTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> statisticNames = [
      AppStrings.finshing,
      AppStrings.crossing,
      AppStrings.headingAccuracy,
      AppStrings.shortPassing,
      AppStrings.volleys,
      AppStrings.dribbling,
      AppStrings.curve,
      AppStrings.freekickAccuracy,
      AppStrings.ballControl,
      AppStrings.acceleration,
      AppStrings.sprinSpeed,
      AppStrings.shotPower,
      AppStrings.marking,
      AppStrings.strength,
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: statisticNames
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: StatisticRow(
                            name: e,
                            value: '85/100',
                          ),
                        ),
                      )
                      .toList(),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                // itemBuilder: (context, index) => Padding(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: StatisticRow(
                //     name: statisticNames[index],
                //     value: '85/100',
                //   ),
                //   ),
                //   itemCount: statisticNames.length,
                // ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.tryModel,
                  style: AppTextStyles.styleSemiBold18(context)
                      .copyWith(color: AppColors.blackColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.tryModelDesciption,
                  style: AppTextStyles.styleRegular14(context),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppButton(
                  textButton: AppStrings.starScaning,
                  onPressed: () {},
                  widthButton: double.infinity,
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
