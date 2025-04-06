import 'package:evoluton_x/features/details/data/models/player_details_card_model.dart';
import 'package:evoluton_x/features/details/domain/entities/player_details.dart';

class PlayerDetailsModel extends PlayerDetails {
  const PlayerDetailsModel({required super.msg, required super.data});

  factory PlayerDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlayerDetailsModel(
        msg: json['msg'],
        data: PlayerDetailsCardModel.fromJson(json['data']),
      );
}
