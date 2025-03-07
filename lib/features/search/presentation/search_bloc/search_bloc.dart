import 'dart:async';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<String> nations = ["England", "Spain", "Italy", "Germany"];
  List<String> clubs = ['Real madrid', 'Barcelona', 'Real betis', 'Getafe'];
  List<String> positions = ['GK', 'CB', 'MID', 'FW'];
  List<String> age = ['14 - 18', '19 - 24', '25 - 30', '30 - 34'];

  SearchBloc() : super(const SearchState()) {
    on<SelectedNationEvent>(_selectNation);
    on<SavedNationEvent>(_savedNation);
    on<SelectedClubEvent>(_selectClub);
    on<SavedClubEvent>(_savedClub);
    on<SelectedPositionEvent>(_selectedPosition);
    on<SavedPositionEvent>(_savedPosition);
    on<SelectedAgeEvent>(_selectedAge);
    on<SavedAgeEvent>(_savedAge);
  }

  FutureOr<void> _savedAge(event, emit) {
    emit(state.copyWith(
      savedAge: event.savedAge,
    ));
  }

  FutureOr<void> _selectedAge(event, emit) {
    emit(
      state.copyWith(
        selectedAge: event.selectedAge,
      ),
    );
  }

  FutureOr<void> _savedPosition(event, emit) {
    emit(
      state.copyWith(
        savedPosition: event.savedPosition,
      ),
    );
  }

  FutureOr<void> _selectedPosition(event, emit) {
    emit(
      state.copyWith(selectedPosition: event.selectedPosition),
    );
  }

  FutureOr<void> _savedClub(event, emit) {
    emit(
      state.copyWith(
        savedClub: event.savedClub,
      ),
    );
  }

  FutureOr<void> _selectClub(event, emit) {
    emit(
      state.copyWith(
        selectedClub: event.selectedClub,
      ),
    );
  }

  FutureOr<void> _savedNation(event, emit) {
    emit(
      state.copyWith(
        savedNation: event.savedNation,
      ),
    );
  }

  FutureOr<void> _selectNation(event, emit) {
    emit(
      state.copyWith(
        selectedNation: event.selectedNation,
      ),
    );
  }
}
