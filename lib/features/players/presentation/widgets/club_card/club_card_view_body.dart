import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/players/presentation/widgets/club_card/custom_card_club_sliver_appbar.dart';
import 'package:evoluton_x/features/players/presentation/widgets/club_card/team_tab_bar_view.dart';
import 'package:evoluton_x/features/players/presentation/widgets/club_card/top_players_tab_bar_view.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';

class ClubCardViewBody extends StatelessWidget {
  final TabController tabController;

  const ClubCardViewBody({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CustomCardClubSleverAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          SliverPersistentHeader(
            delegate: SliverAppBarDelegate(
              CustomTabBar(
                tabController: tabController,
                firstTab: AppStrings.team,
                secondTab: AppStrings.topPlayers,
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: const [
            TeamTabBarView(),
            TopPlayersTapBarView(),
          ],
        ),
      ),
    );
  }
}
