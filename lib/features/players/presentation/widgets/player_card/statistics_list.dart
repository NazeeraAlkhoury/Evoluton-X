import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/players/domain/entities/player_item_input.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_state.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/statistic_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsList extends StatelessWidget {
  const StatisticsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (previous, current) =>
          previous.playerStatisticsState != current.playerStatisticsState,
      builder: (context, state) {
        return RequestStateHandleWidget(
          requestState: state.playerStatisticsState,
          errorMessage: state.playertStatisticsErrMessage,
          successWidget: (context) {
            final data = state.playerStatisticsResponse!.data;
            final items = [
              PlayerItemInput(
                  title: AppStrings.finshing, value: data.finishing.toString()),
              PlayerItemInput(
                  title: AppStrings.agility, value: data.agility.toString()),
              PlayerItemInput(
                  title: AppStrings.jumping, value: data.jumping.toString()),
              PlayerItemInput(
                  title: AppStrings.headingAccuracy,
                  value: data.headingAccuracy.toString()),
              PlayerItemInput(
                  title: AppStrings.freekickAccuracy,
                  value: data.freekickAccuracy.toString()),
            ];

            return Column(
              children: items
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: StatisticRow(
                        item: item,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}
