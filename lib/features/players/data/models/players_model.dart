import 'package:evoluton_x/features/players/data/models/club_model.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';

class PlayersModel extends Player {
  const PlayersModel({
    required super.id,
    required super.name,
    required super.positions,
    required super.power,
    required super.clubId,
    required super.age,
    required super.nation,
    required super.imageUrl,
    required super.club,
  });

  factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        id: json['id'],
        name: json['name'],
        positions: json['positions'],
        power: json['power'],
        clubId: json['club_id'],
        age: json['age'],
        nation: json['nation'],
        imageUrl: json['image_url'] == null
            ? []
            : List<String>.from(
                (json['image_url'] as List).map((e) => e.toString())),
        club: ClubModel.fromJson(json['club']),
      );
}
