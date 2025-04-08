import 'package:evoluton_x/features/player/data/models/prediction_result_data_model.dart';
import 'package:evoluton_x/features/player/domain/entities/prediction_result.dart';

class PredictionResultModel extends PredictionResult {
  const PredictionResultModel({
    required super.msg,
    required super.data,
  });

  factory PredictionResultModel.fromJson(Map<String, dynamic> json) =>
      PredictionResultModel(
        msg: json['msg'],
        data: PredictionResultDataModel.fromJson(json['data']),
      );
}
