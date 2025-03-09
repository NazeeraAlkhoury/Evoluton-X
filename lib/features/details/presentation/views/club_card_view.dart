import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_card_club_sliver_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/team_tab_bar_view.dart';
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
            children: [
              const TeamTabBarView(),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
