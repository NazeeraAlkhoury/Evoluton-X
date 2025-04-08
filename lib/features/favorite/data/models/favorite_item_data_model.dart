import 'package:evoluton_x/features/player/data/models/players_model.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite_item_data.dart';

class FavoriteItemDataModel extends FavoriteItemData {
  const FavoriteItemDataModel({
    required super.id,
    required super.userId,
    required super.playerId,
    required super.player,
  });

  factory FavoriteItemDataModel.fromJson(Map<String, dynamic> json) =>
      FavoriteItemDataModel(
          id: json['id'],
          userId: json['user_id'],
          playerId: json['player_id'],
          player: PlayersModel.fromJson(
            json['player'],
          ));
}
