import 'package:equatable/equatable.dart';

class ClubFilterState extends Equatable {
  final String? selectedNation;
  final String? savedNation;
  final String? selectedClub;
  final String? savedClub;
  const ClubFilterState(
      {this.selectedClub,
      this.savedClub,
      this.savedNation,
      this.selectedNation});

  ClubFilterState copyWith({
    String? selectedNation,
    String? savedNation,
    String? selectedClub,
    String? savedClub,
  }) =>
      ClubFilterState(
        selectedNation: selectedNation ?? this.selectedNation,
        savedNation: savedNation ?? this.savedNation,
        selectedClub: selectedClub ?? this.selectedClub,
        savedClub: savedClub ?? this.savedClub,
      );
  @override
  List<Object?> get props =>
      [selectedNation, savedNation, selectedClub, savedClub];
}
