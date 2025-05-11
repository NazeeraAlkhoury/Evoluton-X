import 'package:evoluton_x/features/players/data/models/players_model.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';

class AllPlayersModel extends AllPlayers {
  const AllPlayersModel({required super.msg, required super.data});

  factory AllPlayersModel.fromJson(Map<String, dynamic> json) =>
      AllPlayersModel(
        msg: json['msg'],
        data: List<Player>.from(
          (json['data'] as List).map(
            (playerJson) => PlayersModel.fromJson(playerJson),
          ),
        ),
      );
}
