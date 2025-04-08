import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/players/presentation/views/details_view.dart';
import 'package:evoluton_x/features/favorite/presentation/views/favorite_view.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_event.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_state.dart';
import 'package:evoluton_x/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  // final PersistentTabController persistentTabController =
  //     PersistentTabController(initialIndex: 0);

  final List<Widget> screens = const [
    DetailsView(),
    SearchView(),
    FavoriteView(),
  ];

  LayoutBloc()
      : super(
          const LayoutState(),
        ) {
    on<NavBarItemTappedEvent>(onItemSelected);
  }

  FutureOr<void> onItemSelected(event, emit) {
    //  persistentTabController.jumpToTab(event.index);

    emit(
      state.copyWith(
        selectedIndex: event.index,
        selectItemState: RequestStates.successState,
      ),
    );
  }

  // @override
  // Future<void> close() {
  //   persistentTabController.dispose();

  //   return super.close();
  // }
}
