import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_state.dart';
import 'package:flutter/material.dart';

class ClubFilterBloc extends Bloc<ClubFilterEvent, ClubFilterState> {
  TextEditingController nameController = TextEditingController();
  List<String> comps = [
    'Premier League',
    'La Liga',
    'Bundesliga',
    'Serie A',
    'Ligue 1',
  ];
  ClubFilterBloc() : super(const ClubFilterState()) {
    on<ClubNameChangedEvent>(_onClubNameChanged);
    on<SavedNameEvent>(_savedName);
    on<SelectedCompEvent>(_selectedComp);
    on<SavedCompEvent>(_savedComp);

    nameController.addListener(() {
      add(ClubNameChangedEvent(nameController.text));
    });
  }

  FutureOr<void> _savedComp(event, emit) {
    emit(
      state.copyWith(
        savedComp: event.savedComp,
      ),
    );
  }

  FutureOr<void> _selectedComp(event, emit) {
    emit(
      state.copyWith(
        selectedComp: event.selectedComp,
      ),
    );
  }

  FutureOr<void> _onClubNameChanged(
      ClubNameChangedEvent event, Emitter<ClubFilterState> emit) {
    emit(state.copyWith(clubName: event.clubName));
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
}
