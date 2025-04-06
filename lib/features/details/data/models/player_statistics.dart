import 'package:evoluton_x/features/details/data/models/player_statistics_card_model.dart';
import 'package:evoluton_x/features/details/domain/entities/player_statistics.dart';

class PlayerStatisticsModel extends PlayerStatistics {
  const PlayerStatisticsModel({required super.msg, required super.data});

  factory PlayerStatisticsModel.fromJson(Map<String, dynamic> json) =>
      PlayerStatisticsModel(
        msg: json['msg'],
        data: PlayerStatisticsCardModel.fromJson(json['data']),
      );
}
