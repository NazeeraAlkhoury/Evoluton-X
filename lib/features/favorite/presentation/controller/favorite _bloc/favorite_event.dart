import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddPlayerToFavoritesEvent extends FavoriteEvent {
  // final num idPlayer;

  const AddPlayerToFavoritesEvent();

  @override
  List<Object> get props => [];
}

class RemovePlayerFromFavoritesEvent extends FavoriteEvent {
  final int idPlayer;

  const RemovePlayerFromFavoritesEvent({required this.idPlayer});

  @override
  List<Object> get props => [];
}
