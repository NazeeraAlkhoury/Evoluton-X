import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';
import 'package:evoluton_x/features/search/domain/repository/search_repository.dart';

class GetAllPlayersUsecase extends BaseUseCases<AllPlayers, NoParameters> {
  final SearchRepository searchRepository;

  GetAllPlayersUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, AllPlayers>> call(NoParameters parameters) async {
    return await searchRepository.getAllPlayers();
  }
}
