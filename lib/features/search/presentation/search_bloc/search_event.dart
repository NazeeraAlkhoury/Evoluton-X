import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SelectedNationEvent extends SearchEvent {
  final String? selectedNation;

  const SelectedNationEvent({required this.selectedNation});
  @override
  List<Object?> get props => [selectedNation];
}

class SavedNationEvent extends SearchEvent {
  final String? savedNation;

  const SavedNationEvent({required this.savedNation});
  @override
  List<Object?> get props => [savedNation];
}

class SelectedClubEvent extends SearchEvent {
  final String? selectedClub;

  const SelectedClubEvent({required this.selectedClub});
  @override
  List<Object?> get props => [selectedClub];
}

class SavedClubEvent extends SearchEvent {
  final String? savedClub;

  const SavedClubEvent({required this.savedClub});
  @override
  List<Object?> get props => [savedClub];
}

class SelectedPositionEvent extends SearchEvent {
  final String? selectedPosition;

  const SelectedPositionEvent({required this.selectedPosition});
  @override
  List<Object?> get props => [selectedPosition];
}

class SavedPositionEvent extends SearchEvent {
  final String? savedPosition;

  const SavedPositionEvent({required this.savedPosition});
  @override
  List<Object?> get props => [savedPosition];
}

class SelectedAgeEvent extends SearchEvent {
  final String? selectedAge;

  const SelectedAgeEvent({required this.selectedAge});
  @override
  List<Object?> get props => [selectedAge];
}

class SavedAgeEvent extends SearchEvent {
  final String? savedAge;

  const SavedAgeEvent({required this.savedAge});
  @override
  List<Object?> get props => [savedAge];
}
