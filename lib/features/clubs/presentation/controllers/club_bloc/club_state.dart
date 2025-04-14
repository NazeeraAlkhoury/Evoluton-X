import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card.dart';

class ClubState extends Equatable {
  final RequestStates getClubsState;
  final AllClubs? clubs;
  final String getClubsErrMessage;

  final RequestStates getClubCardState;
  final ClubCard? clubCard;
  final String getClubCardErrMessage;

  const ClubState({
    this.getClubsState = RequestStates.initialState,
    this.clubs,
    this.getClubsErrMessage = '',
    this.getClubCardState = RequestStates.initialState,
    this.clubCard,
    this.getClubCardErrMessage = '',
  });

  ClubState copyWith({
    RequestStates? getClubsState,
    AllClubs? clubs,
    String? getClubsErrMessage,
    RequestStates? getClubCardState,
    ClubCard? clubCard,
    String? getClubCardErrMessage,
  }) =>
      ClubState(
        getClubsState: getClubsState ?? this.getClubsState,
        clubs: clubs ?? this.clubs,
        getClubsErrMessage: getClubsErrMessage ?? this.getClubsErrMessage,
        getClubCardState: getClubCardState ?? this.getClubCardState,
        clubCard: clubCard ?? this.clubCard,
        getClubCardErrMessage:
            getClubCardErrMessage ?? this.getClubCardErrMessage,
      );

  @override
  List<Object?> get props => [
        getClubsState,
        clubs,
        getClubsErrMessage,
        getClubCardState,
        clubCard,
        getClubCardErrMessage,
      ];
}
