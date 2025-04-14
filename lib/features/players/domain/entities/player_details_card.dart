import 'package:equatable/equatable.dart';

class PlayerDetailsCard extends Equatable {
  final String name;
  final String pos;
  final num power;
  final String age;
  final num overallRating;
  final String preferredFoot;
  final num valueEuro;
  final List<String> imageUrl;
  final String nation;
  final String clubImage;

  const PlayerDetailsCard({
    required this.name,
    required this.pos,
    required this.power,
    required this.age,
    required this.overallRating,
    required this.preferredFoot,
    required this.valueEuro,
    required this.imageUrl,
    required this.nation,
    required this.clubImage,
  });

  @override
  List<Object?> get props => [
        name,
        pos,
        power,
        age,
        overallRating,
        valueEuro,
        imageUrl,
        nation,
        clubImage,
      ];
}
