import 'package:evoluton_x/features/clubs/data/models/player_in_team_model.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card_data.dart';
import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';

class ClubCardCardDataModel extends ClubCardData {
  const ClubCardCardDataModel({
    required super.name,
    required super.nation,
    required super.nationName,
    required super.imageUrl,
    required super.teamPlayers,
    required super.teamOverallRating,
    required super.teamPower,
    required super.teamPredictionResult,
  });

  factory ClubCardCardDataModel.fromJson(Map<String, dynamic> json) =>
      ClubCardCardDataModel(
        name: json['name'],
        nation: json['nation'],
        nationName: json['nation_name'],
        imageUrl: json['image_url'],
        teamPlayers: json['team_players'] == null
            ? []
            : List<PlayerInTeam>.from((json['team_players'] as List)
                .map((e) => PlayerInTeamModel.fromJson(e))),
        teamOverallRating: json['team_overall_rating'] == null
            ? []
            : List<PlayerInTeam>.from((json['team_overall_rating'] as List)
                .map((e) => PlayerInTeamModel.fromJson(e))),
        teamPower: json['team_power'] == null
            ? []
            : List<PlayerInTeam>.from((json['team_power'] as List)
                .map((e) => PlayerInTeamModel.fromJson(e))),
        teamPredictionResult: json['team_prediction_result'] == null
            ? []
            : List<PlayerInTeam>.from((json['team_prediction_result'] as List)
                .map((e) => PlayerInTeamModel.fromJson(e))),
      );
}
