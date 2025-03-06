import 'package:equatable/equatable.dart';

class ClubFilterEvent extends Equatable {
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
