import 'dart:async';

import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/search/domain/usecases/get_all_players_usecase.dart';
import 'package:evoluton_x/features/search/domain/usecases/search_usecase.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TextEditingController nameController = TextEditingController();

  final SearchUsecase searchUsecase;
  final GetAllPlayersUsecase getAllPlayersUsecase;
  SearchBloc({
    required this.searchUsecase,
    required this.getAllPlayersUsecase,
  }) : super(const SearchState()) {
    on<PlayerNameChangedEvent>(_onPlayerNameChanged);
    on<SavedNameEvent>(_savedName);
    on<SearchPlayersEvent>(_search);
    on<ResetSearchEvent>(_resetSearch);
    on<GetPlayersEvent>(_getPlayers);
    nameController.addListener(() {
      add(PlayerNameChangedEvent(nameController.text));
    });
    // on<SelectedNationEvent>(_selectNation);
    // on<SavedNationEvent>(_savedNation);
    // on<SelectedClubEvent>(_selectClub);
    // on<SavedClubEvent>(_savedClub);
    // on<SelectedPositionEvent>(_selectedPosition);
    // on<SavedPositionEvent>(_savedPosition);
    // on<SelectedAgeEvent>(_selectedAge);
    // on<SavedAgeEvent>(_savedAge);
  }

  FutureOr<void> _getPlayers(event, emit) async {
    emit(
      state.copyWith(
        getPlayersState: RequestStates.loadingState,
      ),
    );
    final result = await getAllPlayersUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          getPlayersState: RequestStates.failureState,
          getPlayersErrMessage: failure.errorMessage,
        ),
      ),
      (players) => emit(
        state.copyWith(
          getPlayersState: RequestStates.successState,
          getPlayers: players,
        ),
      ),
    );
  }

  FutureOr<void> _search(event, emit) async {
    emit(
      state.copyWith(
        searchState: RequestStates.loadingState,
      ),
    );
    final result = await searchUsecase(event.name);
    result.fold(
      (failure) => emit(
        state.copyWith(
          searchState: RequestStates.failureState,
          searchErrMessage: failure.errorMessage,
        ),
      ),
      (players) => emit(
        state.copyWith(
          searchState: RequestStates.successState,
          players: players,
        ),
      ),
    );
  }

  FutureOr<void> _resetSearch(event, emit) {
    nameController.clear();
    emit(const SearchState(
      savedName: null,
      playerName: '',
      searchState: RequestStates.initialState,
      players: null,
      searchErrMessage: '',
    ));
  }

  FutureOr<void> _onPlayerNameChanged(
      PlayerNameChangedEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(playerName: event.playerName));
  }

  FutureOr<void> _savedName(event, emit) {
    emit(
      state.copyWith(
        savedName: event.savedName,
      ),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }
  // FutureOr<void> _savedAge(event, emit) {
  //   emit(state.copyWith(
  //     savedAge: event.savedAge,
  //   ));
  // }

  // FutureOr<void> _selectedAge(event, emit) {
  //   emit(
  //     state.copyWith(
  //       selectedAge: event.selectedAge,
  //     ),
  //   );
  // }

  // FutureOr<void> _savedPosition(event, emit) {
  //   emit(
  //     state.copyWith(
  //       savedPosition: event.savedPosition,
  //     ),
  //   );
  // }

  // FutureOr<void> _selectedPosition(event, emit) {
  //   emit(
  //     state.copyWith(selectedPosition: event.selectedPosition),
  //   );
  // }

  // FutureOr<void> _savedClub(event, emit) {
  //   emit(
  //     state.copyWith(
  //       savedClub: event.savedClub,
  //     ),
  //   );
  // }

  // FutureOr<void> _selectClub(event, emit) {
  //   emit(
  //     state.copyWith(
  //       selectedClub: event.selectedClub,
  //     ),
  //   );
  // }

  // FutureOr<void> _savedNation(event, emit) {
  //   emit(
  //     state.copyWith(
  //       savedNation: event.savedNation,
  //     ),
  //   );
  // }

  // FutureOr<void> _selectNation(event, emit) {
  //   emit(
  //     state.copyWith(
  //       selectedNation: event.selectedNation,
  //     ),
  //   );
  // }
}
