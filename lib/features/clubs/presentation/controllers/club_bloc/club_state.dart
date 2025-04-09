import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';

class ClubState extends Equatable {
  final RequestStates getClubsState;
  final AllClubs? clubs;
  final String getClubsErrMessage;

  const ClubState({
    this.getClubsState = RequestStates.initialState,
    this.clubs,
    this.getClubsErrMessage = '',
  });

  ClubState copyWith(
          {RequestStates? getClubsState,
          AllClubs? clubs,
          String? getClubsErrMessage,
          required}) =>
      ClubState(
        getClubsState: getClubsState ?? this.getClubsState,
        clubs: clubs ?? this.clubs,
        getClubsErrMessage: getClubsErrMessage ?? this.getClubsErrMessage,
      );

  @override
  List<Object?> get props => [
        getClubsState,
        clubs,
        getClubsErrMessage,
      ];
}
