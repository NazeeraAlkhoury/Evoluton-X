import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/team_players_section.dart';
import 'package:flutter/material.dart';

class TeamTabBarView extends StatelessWidget {
  const TeamTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TeamPlayersSection(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
