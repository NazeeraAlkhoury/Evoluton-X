import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';

class SearchState extends Equatable {
  final String playerName;
  final String? savedName;
  final RequestStates searchState;
  final AllPlayers? players;
  final String searchErrMessage;
  final RequestStates getPlayersState;
  final AllPlayers? getPlayers;
  final String getPlayersErrMessage;
  // final String? selectedNation;
  // final String? savedNation;
  // final String? selectedClub;
  // final String? savedClub;
  // final String? selectedPosition;
  // final String? savedPosition;
  // final String? selectedAge;
  // final String? savedAge;
  const SearchState({
    this.playerName = '',
    this.savedName,
    this.searchState = RequestStates.initialState,
    this.players,
    this.searchErrMessage = '',
    this.getPlayersState = RequestStates.initialState,
    this.getPlayers,
    this.getPlayersErrMessage = '',

    //   this.selectedNation,
    // this.savedNation,
    // this.selectedClub,
    // this.savedClub,
    // this.selectedPosition,
    // this.savedPosition,
    // this.selectedAge,
    // this.savedAge
  });

  SearchState copyWith({
    String? playerName,
    String? savedName,
    RequestStates? searchState,
    AllPlayers? players,
    String? searchErrMessage,
    RequestStates? getPlayersState,
    AllPlayers? getPlayers,
    String? getPlayersErrMessage,
    // String? selectedNation,
    // String? savedNation,
    // String? selectedClub,
    // String? savedClub,
    // String? selectedPosition,
    // String? savedPosition,
    // String? selectedAge,
    // String? savedAge,
  }) =>
      SearchState(
        playerName: playerName ?? this.playerName,
        savedName: savedName ?? this.savedName,
        searchState: searchState ?? this.searchState,
        players: players ?? this.players,
        searchErrMessage: searchErrMessage ?? this.searchErrMessage,
        getPlayersState: getPlayersState ?? this.getPlayersState,
        getPlayers: getPlayers ?? this.getPlayers,
        getPlayersErrMessage: getPlayersErrMessage ?? this.getPlayersErrMessage,
        // selectedNation: selectedNation ?? this.selectedNation,
        // savedNation: savedNation ?? this.savedNation,
        // selectedClub: selectedClub ?? this.selectedClub,
        // savedClub: savedClub ?? this.savedClub,
        // selectedPosition: selectedPosition ?? this.selectedPosition,
        // savedPosition: savedPosition ?? this.savedPosition,
        // selectedAge: selectedAge ?? this.selectedAge,
        // savedAge: savedAge ?? this.savedAge,
      );

  @override
  List<Object?> get props => [
        playerName, savedName, searchState, players, searchErrMessage,
        getPlayersErrMessage,
        getPlayers,
        getPlayersState,
        // selectedNation,
        // savedNation,
        // selectedClub,
        // savedClub,
        // selectedPosition,
        // savedPosition,
        // savedClub,
        // selectedAge,
        // savedAge
      ];
}
