import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/details/domain/entities/player_details.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';

class GetPlayerDetailsUsecase extends BaseUseCases<PlayerDetails, int> {
  final DetailsRepository detailsRepository;

  GetPlayerDetailsUsecase({required this.detailsRepository});

  @override
  Future<Either<Failure, PlayerDetails>> call(int parameters) async {
    return await detailsRepository.getPlayerDetails(playerId: parameters);
  }
}
