import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';

class GetFavoritePlayersUsecase
    implements BaseUseCases<Favorite, NoParameters> {
  final FavoriteRepository favoriteRepository;

  GetFavoritePlayersUsecase({required this.favoriteRepository});
  @override
  Future<Either<Failure, Favorite>> call(NoParameters parameters) async {
    return await favoriteRepository.getFavoritesPlayer();
  }
}
