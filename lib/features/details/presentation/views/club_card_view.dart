import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_show_row.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/achieved_chances_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/assists_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_card_club_sliver_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_goal_states.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_players_xg.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/goales_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/team_tab_bar_view.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/top_midfield_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/top_strikers_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/xg_section.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';

class ClubCardView extends StatefulWidget {
  const ClubCardView({super.key});

  @override
  State<ClubCardView> createState() => _ClubCardViewState();
}

class _ClubCardViewState extends State<ClubCardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const CustomCardClubSleverAppBar(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                CustomTabBar(
                  tabController: _tabController,
                  firstTab: AppStrings.team,
                  secondTab: AppStrings.topPlayers,
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: const [TeamTabBarView(), TopPlayersTaoBarView()],
          ),
        ),
      ),
    );
  }
}

class TopPlayersTaoBarView extends StatelessWidget {
  const TopPlayersTaoBarView({
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
