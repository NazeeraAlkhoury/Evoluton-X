import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';

import 'package:evoluton_x/features/details/domain/entities/player_statistics.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';

class GetPlayerStatisticsUsecase extends BaseUseCases<PlayerStatistics, int> {
  final DetailsRepository detailsRepository;

  GetPlayerStatisticsUsecase({required this.detailsRepository});

  @override
  Future<Either<Failure, PlayerStatistics>> call(int parameters) async {
    return await detailsRepository.getPlayerStatistics(playerId: parameters);
  }
}
