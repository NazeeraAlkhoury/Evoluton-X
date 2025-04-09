import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_event.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_state.dart';
import 'package:evoluton_x/features/players/presentation/widgets/details/best_club_listview.dart';
import 'package:evoluton_x/core/widgets/custom_show_row.dart';
import 'package:evoluton_x/features/players/presentation/widgets/details/players_card_listview.dart';
import 'package:evoluton_x/features/players/presentation/widgets/details/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SliderSection(),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(
            AppStrings.suggest,
            style: AppTextStyles.styleSemiBold18(context)
                .copyWith(color: AppColors.blackColor),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: BlocBuilder<PlayerBloc, PlayerState>(
            buildWhen: (previous, current) =>
                previous.getDetailsState != current.getDetailsState,
            builder: (context, state) {
              return RequestStateHandleWidget(
                requestState: state.getDetailsState,
                errorMessage: state.getDetailsErrMessage,
                successWidget: (context) => PlayerCardsListView(
                  suggestedPlayers: state.getDetailsResponse!.data.suggested,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: CustomShowRow(
            text: AppStrings.bestclubs,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.clubFilter);
              context.read<ClubBloc>().add(GetClubsEvent());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: BlocBuilder<PlayerBloc, PlayerState>(
            buildWhen: (previous, current) =>
                previous.getDetailsState != current.getDetailsState,
            builder: (context, state) {
              return RequestStateHandleWidget(
                requestState: state.getDetailsState,
                errorMessage: state.getDetailsErrMessage,
                successWidget: (context) => BestClubsListView(
                  bestClubs: state.getDetailsResponse!.data.bestClubs,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
