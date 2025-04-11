import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_state.dart';
import 'package:evoluton_x/core/widgets/appbar/custom_appbar.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/filter_clubs/club_suggestion_grid.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/filter_clubs/clubs_filter_suggestion_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterClubsViewBody extends StatelessWidget {
  const FilterClubsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: ClubsfilterAndSuggestionHeader(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 70,
          ),
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<ClubBloc, ClubState>(
              builder: (context, state) {
                return RequestStateHandleWidget(
                  requestState: state.getClubsState,
                  errorMessage: state.getClubsErrMessage,
                  successWidget: (context) => ClubSuggestionsGrid(
                    club: state.clubs!.data,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
