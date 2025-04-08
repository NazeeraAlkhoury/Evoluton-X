import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/details/domain/entities/player_item_input.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_state.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/player_details_item_gridview.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsTapBarView extends StatelessWidget {
  const DetailsTapBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        height: 200,
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.darkGreyColor,
            width: 1,
          ),
        ),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          buildWhen: (previous, current) =>
              previous.playerDetailsState != current.playerDetailsState,
          builder: (context, state) {
            return RequestStateHandleWidget(
                requestState: state.playerDetailsState,
                errorMessage: state.playertDetailsErrMessage,
                successWidget: (context) {
                  final data = state.playerDetailsResponse!.data;
                  List<PlayerItemInput> items = [
                    PlayerItemInput(title: AppStrings.pos, value: data.pos),
                    PlayerItemInput(
                        title: AppStrings.power, value: data.power.toString()),
                    PlayerItemInput(
                        title: AppStrings.age, value: data.age.toString()),
                    PlayerItemInput(
                        title: AppStrings.rating,
                        value: data.overallRating.toString()),
                    PlayerItemInput(
                        title: AppStrings.favLeg,
                        value: data.preferredFoot.toString()),
                    PlayerItemInput(
                        title: AppStrings.value,
                        value: data.valueEuro.toString()),
                  ];
                  return PlayerDetailsItemGridView(
                    playerDetailsItemInput: items,
                  );
                });
          },
        ),
      ),
    );
  }
}
