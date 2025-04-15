import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, AddRemoveFavorite>> addPlayerToFavorite(
      {required int playerId});
  Future<Either<Failure, AddRemoveFavorite>> removePlayerFromFavorite(
      {required int favoriteId});
  Future<Either<Failure, Favorite>> getFavoritesPlayer();
}
