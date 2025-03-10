// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:evoluton_x/features/details/presentation/widgets/player_card/player_card_view_body.dart';
import 'package:flutter/material.dart';

class PlayerCardView extends StatefulWidget {
  @override
  _PlayerCardView createState() => _PlayerCardView();
}

class _PlayerCardView extends State<PlayerCardView>
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
      body: SafeArea(
        child: PlayerCardViewBody(tabController: _tabController),
      ),
    );
  }
}
  // Scaffold(
  //   body: SafeArea(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           CustomTabBar(
  //             tabController: _tabController,
  //             firstTab: AppStrings.details,
  //             secondTab: AppStrings.statistics,
  //           ),
  //           Expanded(
  //             child: TabBarView(
  //               controller: _tabController,
  //               children: const [
  // DetailsTapBarView(),

  // // second tab bar view widget
  // StatisticTabBarView(),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );

