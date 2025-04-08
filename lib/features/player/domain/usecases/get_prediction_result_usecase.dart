import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/player/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/player/domain/repository/player_repository.dart';

class GetPredictionResultUseCase extends BaseUseCases<PredictionResult, int> {
  final PlayerRepository playerRepository;

  GetPredictionResultUseCase({required this.playerRepository});

  @override
  Future<Either<Failure, PredictionResult>> call(int parameters) async {
    return await playerRepository.getPredictionResult(playerId: parameters);
  }
}
