import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/player/domain/entities/prediction_result_data.dart';

class PredictionResult extends Equatable {
  final String msg;
  final PredictionResultData data;

  const PredictionResult({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
