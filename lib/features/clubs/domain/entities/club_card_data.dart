import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';

class ClubCardData extends Equatable {
  final String name;
  final String nation;
  final String nationName;
  final String imageUrl;
  final List<PlayerInTeam> teamPlayers;
  final List<PlayerInTeam> teamOverallRating;
  final List<PlayerInTeam> teamPower;
  final List<PlayerInTeam> teamPredictionResult;

  const ClubCardData({
    required this.name,
    required this.nation,
    required this.nationName,
    required this.imageUrl,
    required this.teamPlayers,
    required this.teamOverallRating,
    required this.teamPower,
    required this.teamPredictionResult,
  });

  @override
  List<Object?> get props => [
        name,
        nation,
        nationName,
        imageUrl,
        teamPlayers,
        teamOverallRating,
        teamPower,
        teamPredictionResult,
      ];
}
