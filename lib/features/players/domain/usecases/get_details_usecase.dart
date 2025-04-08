import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/players/domain/entities/details.dart';
import 'package:evoluton_x/features/players/domain/repository/player_repository.dart';

class GetDetailsUsecase extends BaseUseCases<Details, NoParameters> {
  final PlayerRepository playerRepository;

  GetDetailsUsecase({required this.playerRepository});
  @override
  Future<Either<Failure, Details>> call(NoParameters parameters) async {
    return await playerRepository.getDetails();
  }
}
