import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';

abstract class ClubFilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClubNameChangedEvent extends ClubFilterEvent {
  final String clubName;
  ClubNameChangedEvent(this.clubName);
  @override
  List<Object?> get props => [clubName];
}

class SavedNameEvent extends ClubFilterEvent {
  final String? savedName;

  SavedNameEvent({required this.savedName});
  @override
  List<Object?> get props => [savedName];
}

class SelectedCompEvent extends ClubFilterEvent {
  final String? selectedComp;

  SelectedCompEvent({required this.selectedComp});
  @override
  List<Object?> get props => [selectedComp];
}

class SavedCompEvent extends ClubFilterEvent {
  final String? savedComp;

  SavedCompEvent({required this.savedComp});
  @override
  List<Object?> get props => [savedComp];
}

class ClubWithFilterEvent extends ClubFilterEvent {
  final ClubsFilterParams clubsFilterParams;

  ClubWithFilterEvent({required this.clubsFilterParams});
  @override
  List<Object?> get props => [clubsFilterParams];
}
