import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoritePlayersEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class AddPlayerToFavoritesEvent extends FavoriteEvent {
  final int playerId;

  const AddPlayerToFavoritesEvent({required this.playerId});

  @override
  List<Object> get props => [playerId];
}

class RemovePlayerFromFavoritesEvent extends FavoriteEvent {
  final int favoriteId;

  const RemovePlayerFromFavoritesEvent({required this.favoriteId});

  @override
  List<Object> get props => [favoriteId];
}
