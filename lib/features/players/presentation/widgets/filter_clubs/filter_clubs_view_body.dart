import 'package:evoluton_x/features/players/presentation/widgets/custom_appbar.dart';
import 'package:evoluton_x/features/players/presentation/widgets/filter_clubs/club_suggestion_grid.dart';
import 'package:evoluton_x/features/players/presentation/widgets/filter_clubs/clubs_filter_suggestion_header.dart';
import 'package:flutter/material.dart';

class FilterClubsViewBody extends StatelessWidget {
  const FilterClubsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: ClubsfilterAndSuggestionHeader(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 70,
          ),
          sliver: ClubSuggestionsGrid(),
        ),
      ],
    );
  }
}
