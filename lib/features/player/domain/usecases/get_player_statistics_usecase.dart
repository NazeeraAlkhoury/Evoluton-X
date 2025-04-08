import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';

import 'package:evoluton_x/features/player/domain/entities/player_statistics.dart';
import 'package:evoluton_x/features/player/domain/repository/player_repository.dart';

class GetPlayerStatisticsUsecase extends BaseUseCases<PlayerStatistics, int> {
  final PlayerRepository playerRepository;

  GetPlayerStatisticsUsecase({required this.playerRepository});

  @override
  Future<Either<Failure, PlayerStatistics>> call(int parameters) async {
    return await playerRepository.getPlayerStatistics(playerId: parameters);
  }
}
