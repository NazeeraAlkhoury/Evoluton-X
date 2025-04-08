import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/player/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/player/presentation/controllers/club_filter_bloc/club_filter_state.dart';

class ClubFilterBloc extends Bloc<ClubFilterEvent, ClubFilterState> {
  List<String> nations = ["England", "Spain", "Italy", "Germany"];
  List<String> clubs = [
    'Real madrid',
    'Barcelona',
    'Real betis',
    'Getafe',
  ];
  ClubFilterBloc() : super(const ClubFilterState()) {
    on<SelectedNationEvent>(_selectNation);
    on<SavedNationEvent>(_savedNation);
    on<SelectedClubEvent>(_selectedClub);
    on<SavedClubEvent>(_savedClub);
  }

  FutureOr<void> _savedClub(event, emit) {
    emit(
      state.copyWith(
        savedClub: event.savedClub,
      ),
    );
  }

  FutureOr<void> _selectedClub(event, emit) {
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
