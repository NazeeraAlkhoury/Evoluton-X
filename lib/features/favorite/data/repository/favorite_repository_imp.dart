import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImp implements FavoriteRepository {
  final FavoriteRemoteDatasource favoritRemoteDatasource;

  FavoriteRepositoryImp({
    required this.favoritRemoteDatasource,
  });
  @override
  Future<Either<Failure, AddRemoveFavorite>> addPlayerToFavorite(
      {required int playerId}) async {
    try {
      final result = await favoritRemoteDatasource.addPlayersToFavorite(
          playerId: playerId);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, AddRemoveFavorite>> removePlayerFromFavorite(
      {required num favoriteId}) async {
    try {
      final result = await favoritRemoteDatasource.removePlayersToFavorite(
          favoriteId: favoriteId);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Favorite>> getFavoritesPlayer() async {
    try {
      final result = await favoritRemoteDatasource.getFavoritesPlayer();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
