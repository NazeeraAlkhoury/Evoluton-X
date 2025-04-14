import 'package:evoluton_x/features/clubs/domain/entities/player_in_team.dart';

class PlayerInTeamModel extends PlayerInTeam {
  const PlayerInTeamModel({
    required super.id,
    required super.clubId,
    required super.fullName,
    required super.nationality,
    required super.overallRating,
    required super.power,
    required super.predictionResult,
    required super.age,
    required super.nation,
    required super.imageUrl,
    required super.isFav,
  });

  factory PlayerInTeamModel.fromJson(Map<String, dynamic> json) =>
      PlayerInTeamModel(
        id: json['id'],
        clubId: json['club_id'],
        fullName: json['full_name'],
        nationality: json['nationality'],
        overallRating: json['overall_rating'],
        power: json['power'],
        predictionResult: json['prediction_result'],
        age: json['age'],
        nation: json['nation'],
        imageUrl: json['image_url'] == null
            ? []
            : List<String>.from(
                (json['image_url'] as List).map((e) => e.toString())),
        isFav: json['is_fav'],
      );
}
