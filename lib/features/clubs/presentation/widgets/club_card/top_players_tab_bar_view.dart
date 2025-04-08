import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/achieved_chances_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/assists_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/goales_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/top_midfield_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/top_strikers_section.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/xg_section.dart';
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
                TopStrikersSection(),
                SizedBox(
                  height: 20,
                ),
                TopMidfielderSection(),
                SizedBox(
                  height: 20,
                ),
                GoalsSection(),
                SizedBox(
                  height: 20,
                ),
                AssistsSection(),
                SizedBox(
                  height: 20,
                ),
                XgSection(),
                SizedBox(
                  height: 20,
                ),
                AchievedChancesSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
