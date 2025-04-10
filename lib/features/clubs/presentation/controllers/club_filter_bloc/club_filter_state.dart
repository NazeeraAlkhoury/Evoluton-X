import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';

class ClubFilterState extends Equatable {
  final String clubName;
  final String? savedName;

  final String? selectedComp;
  final String? savedComp;

  final RequestStates clubWithFilterState;
  final AllClubs? clubs;
  final String clubsWithFilterErrMessage;

  const ClubFilterState({
    this.clubName = '',
    this.savedName,
    this.selectedComp,
    this.savedComp,
    this.clubWithFilterState = RequestStates.initialState,
    this.clubs,
    this.clubsWithFilterErrMessage = '',
  });

  ClubFilterState copyWith({
    String? clubName,
    String? savedName,
    String? selectedComp,
    String? savedComp,
    RequestStates? clubWithFilterState,
    AllClubs? clubs,
    String? clubsWithFilterErrMessage,
  }) =>
      ClubFilterState(
        clubName: clubName ?? this.clubName,
        savedName: savedName ?? this.savedName,
        selectedComp: selectedComp ?? this.selectedComp,
        savedComp: savedComp ?? this.savedComp,
        clubWithFilterState: clubWithFilterState ?? this.clubWithFilterState,
        clubs: clubs ?? this.clubs,
        clubsWithFilterErrMessage:
            clubsWithFilterErrMessage ?? this.clubsWithFilterErrMessage,
      );
  @override
  List<Object?> get props => [
        clubName,
        savedName,
        selectedComp,
        savedComp,
        clubWithFilterState,
        clubs,
        clubsWithFilterErrMessage,
      ];
}
