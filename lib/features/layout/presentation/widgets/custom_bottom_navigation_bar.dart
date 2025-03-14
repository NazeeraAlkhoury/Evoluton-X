import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/features/layout/presentation/widgets/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<String> iconSelected = [
      AppIconAssets.homeSelected,
      AppIconAssets.searchSelected,
      AppIconAssets.favoriteSelected,
    ];
    List<String> icon = [
      AppIconAssets.home,
      AppIconAssets.search,
      AppIconAssets.favorite,
    ];

    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, bottom: 15, top: 5),
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(120),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icon.length,
          (index) => CustomNavBarItem(
            icon: selectedIndex == index ? iconSelected[index] : icon[index],
            isSelected: selectedIndex == index,
            onPressed: () => onItemSelected(index),
          ),
        ),
      ),
    );
  }
}
