import 'package:equatable/equatable.dart';

class ClubFilterState extends Equatable {
  final String? selectedNation;
  final String? savedNation;
  const ClubFilterState({this.savedNation, this.selectedNation});

  ClubFilterState copyWith({
    String? selectedNation,
    String? savedNation,
  }) =>
      ClubFilterState(
        selectedNation: selectedNation ?? this.selectedNation,
        savedNation: savedNation ?? this.savedNation,
      );
  @override
  List<Object?> get props => [selectedNation, savedNation];
}
