import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/custom_card_player_sliver_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/details_tab_bar_view.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/sliver_appbar_delegate.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/statistic_tab_bar_view.dart';
import 'package:flutter/material.dart';

class PlayerCardViewBody extends StatelessWidget {
  const PlayerCardViewBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const CustomCardPlayerSliverAppBar(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
        SliverPersistentHeader(
          delegate: SliverAppBarDelegate(
            CustomTabBar(
              tabController: _tabController,
              firstTab: AppStrings.details,
              secondTab: AppStrings.statistics,
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: const [DetailsTapBarView(), StatisticTabBarView()],
      ),
    );
  }
}
