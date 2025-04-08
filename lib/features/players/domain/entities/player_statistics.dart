import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/players/domain/entities/player_statistics_card.dart';

class PlayerStatistics extends Equatable {
  final String msg;
  final PlayerStatisticsCard data;

  const PlayerStatistics({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
