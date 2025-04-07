import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';

class AddPlayerToFavoriteUsecase
    implements BaseUseCases<AddRemoveFavorite, NoParameters> {
  final FavoriteRepository favoriteRepository;

  AddPlayerToFavoriteUsecase({required this.favoriteRepository});
  @override
  Future<Either<Failure, AddRemoveFavorite>> call(
      NoParameters parameters) async {
    return await favoriteRepository.addPlayerToFavorite();
  }
}
