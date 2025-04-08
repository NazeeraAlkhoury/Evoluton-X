import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/players/domain/entities/player_details.dart';
import 'package:evoluton_x/features/players/domain/repository/player_repository.dart';

class GetPlayerDetailsUsecase extends BaseUseCases<PlayerDetails, int> {
  final PlayerRepository playerRepository;

  GetPlayerDetailsUsecase({required this.playerRepository});

  @override
  Future<Either<Failure, PlayerDetails>> call(int parameters) async {
    return await playerRepository.getPlayerDetails(playerId: parameters);
  }
}
