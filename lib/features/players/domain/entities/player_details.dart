import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/players/domain/entities/player_details_card.dart';

class PlayerDetails extends Equatable {
  final String msg;
  final PlayerDetailsCard data;

  const PlayerDetails({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
