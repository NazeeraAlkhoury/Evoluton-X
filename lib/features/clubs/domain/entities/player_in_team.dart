import 'package:equatable/equatable.dart';

class PlayerInTeam extends Equatable {
  final int id;
  final int clubId;
  final String fullName;
  final String nationality;
  final num overallRating;
  final num power;
  final num predictionResult;
  final String age;
  final String nation;
  final List<String> imageUrl;
  final bool isFav;

  const PlayerInTeam({
    required this.id,
    required this.clubId,
    required this.fullName,
    required this.nationality,
    required this.overallRating,
    required this.power,
    required this.predictionResult,
    required this.age,
    required this.nation,
    required this.imageUrl,
    required this.isFav,
  });

  @override
  List<Object?> get props => [
        id,
        clubId,
        fullName,
        nationality,
        overallRating,
        power,
        predictionResult,
        age,
        nation,
        imageUrl,
        isFav,
      ];
}
