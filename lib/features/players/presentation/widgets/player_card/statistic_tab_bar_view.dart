import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_event.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/statistics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticTabBarView extends StatelessWidget {
  final int playerId;
  const StatisticTabBarView({
    super.key,
    required this.playerId,
  });

  @override
  Widget build(BuildContext context) {
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
                const StatisticsList(),
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
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.scaning,
                        arguments: playerId);

                    context
                        .read<PlayerBloc>()
                        .add(GetPredictionResultEvent(playerId: playerId));
                  },
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
