import 'package:evoluton_x/features/players/domain/entities/player_details_card.dart';

class PlayerDetailsCardModel extends PlayerDetailsCard {
  const PlayerDetailsCardModel({
    required super.name,
    required super.pos,
    required super.power,
    required super.age,
    required super.overallRating,
    required super.preferredFoot,
    required super.valueEuro,
    required super.imageUrl,
    required super.nation,
    required super.clubImage,
  });

  factory PlayerDetailsCardModel.fromJson(Map<String, dynamic> json) =>
      PlayerDetailsCardModel(
        name: json['name'],
        pos: json['pos'],
        power: json['power'],
        age: json['age'],
        overallRating: json['overall_rating'],
        preferredFoot: json['preferred_foot'],
        valueEuro: json['value_euro'],
        imageUrl: json['image_url'] == null
            ? []
            : List<String>.from(
                (json['image_url'] as List).map((e) => e.toString())),
        nation: json['nation'],
        clubImage: json['club_image'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pos': pos,
      'power': power,
      'age': age,
      'overall_rating': overallRating,
      'preferred_foot': preferredFoot,
      'value_euro': valueEuro,
      'image_url': imageUrl,
      'nation': nation,
      'club_image': clubImage,
    };
  }
}
