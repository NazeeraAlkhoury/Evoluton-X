import 'package:evoluton_x/features/details/domain/entities/prediction_result_data.dart';

class PredictionResultDataModel extends PredictionResultData {
  const PredictionResultDataModel({
    required super.id,
    required super.clubId,
    required super.name,
    required super.positions,
    required super.overallRating,
    required super.power,
    required super.valueEuro,
    required super.salaryEuro,
    required super.preferredFoot,
    required super.predictionResult,
    required super.age,
    required super.nation,
    required super.imageUrl,
  });

  factory PredictionResultDataModel.fromJson(Map<String, dynamic> json) =>
      PredictionResultDataModel(
        id: json['id'],
        clubId: json['club_id'],
        name: json['name'],
        positions: json['positions'],
        overallRating: json['overall_rating'],
        power: json['power'],
        valueEuro: json['value_euro'],
        salaryEuro: json['salary_euro'],
        preferredFoot: json['preferred_foot'],
        predictionResult: json['prediction_result'],
        age: json['age'],
        nation: json['nation'],
        imageUrl: json['image_url'] == null
            ? []
            : List<String>.from(
                (json['image_url'] as List).map((e) => e.toString())),
      );
}
