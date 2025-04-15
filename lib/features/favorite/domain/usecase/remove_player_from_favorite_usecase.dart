import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';

class RemovePlayerFromFavoriteUsecase
    implements BaseUseCases<AddRemoveFavorite, int> {
  final FavoriteRepository favoriteRepository;

  RemovePlayerFromFavoriteUsecase({required this.favoriteRepository});
  @override
  Future<Either<Failure, AddRemoveFavorite>> call(int parameters) async {
    return await favoriteRepository.removePlayerFromFavorite(
        favoriteId: parameters);
  }
}
