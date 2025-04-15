import 'package:evoluton_x/features/favorite/data/models/add_remove_favorite_model.dart';
import 'package:evoluton_x/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRemoteDatasource {
  Future<AddRemoveFavoriteModel> addPlayersToFavorite({required int playerId});
  Future<AddRemoveFavoriteModel> removePlayersToFavorite(
      {required num favoriteId});
  Future<FavoriteModel> getFavoritesPlayer();
}
