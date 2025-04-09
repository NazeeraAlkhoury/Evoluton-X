import 'package:equatable/equatable.dart';

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
