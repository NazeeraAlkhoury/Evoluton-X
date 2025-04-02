import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/details/domain/entities/player.dart';

class FavoriteItemData extends Equatable {
  final num id;
  final num userId;
  final num playerId;
  final Player player;

  const FavoriteItemData({
    required this.id,
    required this.userId,
    required this.playerId,
    required this.player,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        playerId,
        player,
      ];
}
