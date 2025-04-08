import 'package:equatable/equatable.dart';

abstract class ClubFilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectedNationEvent extends ClubFilterEvent {
  final String? selectedNation;

  SelectedNationEvent({required this.selectedNation});
  @override
  List<Object?> get props => [selectedNation];
}

class SavedNationEvent extends ClubFilterEvent {
  final String? savedNation;

  SavedNationEvent({required this.savedNation});
  @override
  List<Object?> get props => [savedNation];
}

class SelectedClubEvent extends ClubFilterEvent {
  final String? selectedClub;

  SelectedClubEvent({required this.selectedClub});
  @override
  List<Object?> get props => [selectedClub];
}

class SavedClubEvent extends ClubFilterEvent {
  final String? savedClub;

  SavedClubEvent({required this.savedClub});
  @override
  List<Object?> get props => [savedClub];
}
