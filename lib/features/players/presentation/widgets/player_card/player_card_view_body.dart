import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/custom_card_player_sliver_appbar.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/custom_favorite_player_row.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/details_tab_bar_view.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/sliver_appbar_delegate.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/statistic_tab_bar_view.dart';
import 'package:flutter/material.dart';

class PlayerCardViewBody extends StatelessWidget {
  final TabController tabController;
  final Player player;
  const PlayerCardViewBody(
      {super.key, required this.tabController, required this.player});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomCardPlayerSliverAppBar(
          player: player,
        ),
        SliverToBoxAdapter(
          child: CustomFavoritePlayerRow(player: player),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
        SliverPersistentHeader(
          delegate: SliverAppBarDelegate(
            CustomTabBar(
              tabController: tabController,
              firstTab: AppStrings.details,
              secondTab: AppStrings.statistics,
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: tabController,
        children: [
          const DetailsTapBarView(),
          StatisticTabBarView(
            playerId: player.id,
          )
        ],
      ),
    );
  }
}
