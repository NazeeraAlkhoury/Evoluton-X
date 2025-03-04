import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_event.dart';
import 'package:evoluton_x/features/layout/presentation/widgets/custom_persistent_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_state.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LayoutBloc, LayoutState>(
          builder: (context, state) {
            final bloc = context.read<LayoutBloc>();

            List<PersistentBottomNavBarItem> navBarsItems = [
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.home),
                activeColorPrimary: AppColors.whiteColor,
                inactiveColorPrimary: AppColors.blackColor,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.search_sharp),
                activeColorPrimary: AppColors.whiteColor,
                inactiveColorPrimary: AppColors.blackColor,
                onPressed: (context) => bloc.add(
                  const NavBarItemTappedEvent(index: 1),
                ),
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.favorite_border),
                activeColorPrimary: AppColors.whiteColor,
                inactiveColorPrimary: AppColors.blackColor,
              ),
            ];

            return CustomPersistentTabView(
              controller: bloc.persistentTabController,
              screens: bloc.screens,
              navBarsItems: navBarsItems,
              onItemSelected: (index) =>
                  bloc.add(NavBarItemTappedEvent(index: index)),
            );
          },
        ),
      ),
    );
  }
}
