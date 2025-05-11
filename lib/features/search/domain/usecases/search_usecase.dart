import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';
import 'package:evoluton_x/features/search/domain/repository/search_repository.dart';

class SearchUsecase extends BaseUseCases<AllPlayers, String> {
  final SearchRepository searchRepository;

  SearchUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, AllPlayers>> call(String parameters) async {
    return await searchRepository.search(name: parameters);
  }
}
