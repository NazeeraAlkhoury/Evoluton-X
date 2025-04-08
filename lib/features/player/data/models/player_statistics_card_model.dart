import 'package:evoluton_x/features/player/domain/entities/player_statistics_card.dart';

class PlayerStatisticsCardModel extends PlayerStatisticsCard {
  const PlayerStatisticsCardModel({
    required super.name,
    required super.imageUrl,
    required super.nation,
    required super.clubImage,
    required super.finishing,
    required super.agility,
    required super.jumping,
    required super.headingAccuracy,
    required super.freekickAccuracy,
  });

  factory PlayerStatisticsCardModel.fromJson(Map<String, dynamic> json) =>
      PlayerStatisticsCardModel(
        name: json['name'],
        imageUrl: json['image_url'] == null
            ? []
            : List<String>.from(
                (json['image_url'] as List).map((e) => e.toString())),
        nation: json['nation'],
        clubImage: json['club_image'],
        finishing: json['finishing'],
        agility: json['agility'],
        jumping: json['jumping'],
        headingAccuracy: json['heading_accuracy'],
        freekickAccuracy: json['freekick_accuracy'],
      );
}
