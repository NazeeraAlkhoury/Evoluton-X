import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club.dart';

class Player extends Equatable {
  final int id;
  final String name;
  final String positions;
  final num power;
  final num clubId;
  final String age;
  final String nation;
  final List<String> imageUrl;
  final bool isFav;
  final Club club;

  const Player({
    required this.id,
    required this.name,
    required this.positions,
    required this.power,
    required this.clubId,
    required this.age,
    required this.nation,
    required this.imageUrl,
    required this.isFav,
    required this.club,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        positions,
        power,
        clubId,
        age,
        nation,
        imageUrl,
        isFav,
        club,
      ];
}
