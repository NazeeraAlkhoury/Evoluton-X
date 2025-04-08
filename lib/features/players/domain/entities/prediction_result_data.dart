import 'package:equatable/equatable.dart';

class PredictionResultData extends Equatable {
  final int id;
  final num clubId;
  final String name;
  final String positions;
  final num overallRating;
  final num power;
  final num valueEuro;
  final num salaryEuro;
  final String preferredFoot;
  final num predictionResult;
  final num age;
  final String nation;
  final List<String> imageUrl;

  const PredictionResultData({
    required this.id,
    required this.clubId,
    required this.name,
    required this.positions,
    required this.overallRating,
    required this.power,
    required this.valueEuro,
    required this.salaryEuro,
    required this.preferredFoot,
    required this.predictionResult,
    required this.age,
    required this.nation,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        clubId,
        name,
        positions,
        overallRating,
        power,
        valueEuro,
        salaryEuro,
        preferredFoot,
        predictionResult,
        age,
        nation,
        imageUrl,
      ];
}
