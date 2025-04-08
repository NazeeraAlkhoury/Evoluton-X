import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/player/data/datasource/remote/player_remote_datasource.dart';
import 'package:evoluton_x/features/player/domain/entities/details.dart';
import 'package:evoluton_x/features/player/domain/entities/player_details.dart';
import 'package:evoluton_x/features/player/domain/entities/player_statistics.dart';
import 'package:evoluton_x/features/player/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/player/domain/repository/player_repository.dart';

class PlayerRepositoryImp implements PlayerRepository {
  final PlayerRemoteDatasource playerRemoteDatasource;

  PlayerRepositoryImp({required this.playerRemoteDatasource});
  @override
  Future<Either<Failure, Details>> getDetails() async {
    try {
      final result = await playerRemoteDatasource.getDetails();
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
  Future<Either<Failure, PlayerDetails>> getPlayerDetails(
      {required int playerId}) async {
    try {
      final result =
          await playerRemoteDatasource.getPlayerDetails(playerId: playerId);
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
  Future<Either<Failure, PlayerStatistics>> getPlayerStatistics(
      {required int playerId}) async {
    try {
      final result =
          await playerRemoteDatasource.getPlayerStatistics(playerId: playerId);
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
  Future<Either<Failure, PredictionResult>> getPredictionResult(
      {required int playerId}) async {
    try {
      final result =
          await playerRemoteDatasource.getPredictionResult(playerId: playerId);
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
