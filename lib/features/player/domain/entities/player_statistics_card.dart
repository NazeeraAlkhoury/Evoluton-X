import 'package:equatable/equatable.dart';

class PlayerStatisticsCard extends Equatable {
  final String name;
  final List<String> imageUrl;
  final String nation;
  final String clubImage;
  final num finishing;
  final num agility;
  final num jumping;
  final num headingAccuracy;
  final num freekickAccuracy;

  const PlayerStatisticsCard({
    required this.name,
    required this.imageUrl,
    required this.nation,
    required this.clubImage,
    required this.finishing,
    required this.agility,
    required this.jumping,
    required this.headingAccuracy,
    required this.freekickAccuracy,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        nation,
        clubImage,
        finishing,
        agility,
        jumping,
        headingAccuracy,
        freekickAccuracy,
      ];
}
