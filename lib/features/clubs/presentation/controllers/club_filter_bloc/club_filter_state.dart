import 'package:equatable/equatable.dart';

class ClubFilterState extends Equatable {
  final String clubName;
  final String? savedName;
  final String? selectedComp;
  final String? savedComp;

  const ClubFilterState({
    this.clubName = '',
    this.savedName,
    this.selectedComp,
    this.savedComp,
  });

  ClubFilterState copyWith({
    String? clubName,
    String? savedName,
    String? selectedComp,
    String? savedComp,
  }) =>
      ClubFilterState(
        clubName: clubName ?? this.clubName,
        savedName: savedName ?? this.savedName,
        selectedComp: selectedComp ?? this.selectedComp,
        savedComp: savedComp ?? this.savedComp,
      );
  @override
  List<Object?> get props => [
        clubName,
        savedName,
        selectedComp,
        savedComp,
      ];
}
