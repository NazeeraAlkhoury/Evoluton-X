import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  final TabController tabController;
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.firstTab,
    required this.secondTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30)),
        indicatorColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.offWhiteColor,
        dividerColor: Colors.transparent,
        unselectedLabelColor: const Color(0xffD4D2D2),
        labelStyle: AppTextStyles.styleSemiBold18(context),
        unselectedLabelStyle: AppTextStyles.styleSemiBold18(context),
        tabs: [
          Tab(
            text: firstTab,
          ),
          Tab(
            text: secondTab,
          ),
        ],
      ),
    );
  }
}
