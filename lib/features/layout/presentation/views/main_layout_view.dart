import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_bloc.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_event.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_event.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_state.dart';
import 'package:evoluton_x/features/layout/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final bloc = context.read<LayoutBloc>();
        if (state.selectedIndex == 0) {
          context.read<PlayerBloc>().add(const GetDetailsEvent());
        }
        if (state.selectedIndex == 2) {
          context.read<FavoriteBloc>().add(GetFavoritePlayersEvent());
        }
        return Scaffold(
          body: bloc.screens[state.selectedIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: state.selectedIndex,
              onItemSelected: (index) {
                bloc.add(
                  NavBarItemTappedEvent(index: index),
                );
              }),
        );
      },
    );
  }
}
