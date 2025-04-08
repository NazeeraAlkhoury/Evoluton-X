import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_tab_bar.dart';
import 'package:evoluton_x/features/details/domain/entities/player.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/custom_card_player_sliver_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/details_tab_bar_view.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/sliver_appbar_delegate.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/statistic_tab_bar_view.dart';
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
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            child: Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
                Text(
                  'Add to Favorites',
                  style: AppTextStyles.styleMedium15(context).copyWith(
                    color: AppColors.redColor,
                  ),
                )
              ],
            ),
          ),
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




//  AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       transitionBuilder: (child, animation) =>
//           ScaleTransition(scale: animation, child: child),
//       child: IconButton(
//         key: ValueKey(widget.isFavorite),
//         icon: Icon(
//           widget.isFavorite ? Icons.favorite : Icons.favorite_border,
//           color: widget.isFavorite ? Colors.redAccent : Colors.grey,
//           size: 30,
//         ),
//         onPressed: widget.onToggle,
//         tooltip: widget.isFavorite ? 'إزالة من المفضلة' : 'إضافة إلى المفضلة',
//       ),
//     );