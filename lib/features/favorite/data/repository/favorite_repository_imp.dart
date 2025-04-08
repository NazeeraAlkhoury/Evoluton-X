import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImp implements FavoriteRepository {
  final FavoriteRemoteDatasource favoritRemoteDatasource;

  FavoriteRepositoryImp({
    required this.favoritRemoteDatasource,
  });
  @override
  Future<Either<Failure, AddRemoveFavorite>> addPlayerToFavorite() async {
    try {
      final result = await favoritRemoteDatasource.addPlayersToFavorite();
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
      {required num playerId}) async {
    try {
      final result = await favoritRemoteDatasource.removePlayersToFavorite(
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
}
