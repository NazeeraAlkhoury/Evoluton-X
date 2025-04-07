import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/details/domain/entities/details.dart';
import 'package:evoluton_x/features/details/domain/entities/player_details.dart';
import 'package:evoluton_x/features/details/domain/entities/player_statistics.dart';
import 'package:evoluton_x/features/details/domain/entities/prediction_result.dart';

abstract class DetailsRepository {
  Future<Either<Failure, Details>> getDetails();
  Future<Either<Failure, PlayerDetails>> getPlayerDetails(
      {required int playerId});
  Future<Either<Failure, PlayerStatistics>> getPlayerStatistics(
      {required int playerId});
  Future<Either<Failure, PredictionResult>> getPredictionResult(
      {required int playerId});
}
