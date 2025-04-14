import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/team_overall_rating_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/team_power_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/team_prediction_result_section.dart';
import 'package:flutter/material.dart';

class TopPlayersTapBarView extends StatelessWidget {
  const TopPlayersTapBarView({
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
                TeamOverAllRatingSection(),
                SizedBox(
                  height: 20,
                ),
                TeamPowerSection(),
                SizedBox(
                  height: 20,
                ),
                TeamPredictionResultSection(),
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
