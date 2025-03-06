import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_state.dart';

class ClubFilterBloc extends Bloc<ClubFilterEvent, ClubFilterState> {
  ClubFilterBloc() : super(const ClubFilterState()) {
    on<SelectedNationEvent>(_selectNation);
    on<SavedNationEvent>((event, emit) {
      emit(
        state.copyWith(
          savedNation: event.savedNation,
        ),
      );
    });
  }

  FutureOr<void> _selectNation(event, emit) {
    emit(
      state.copyWith(
        selectedNation: event.selectedNation,
      ),
    );
  }
}
