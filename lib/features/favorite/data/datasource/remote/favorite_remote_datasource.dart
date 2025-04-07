import 'package:evoluton_x/features/favorite/data/models/add_remove_favorite_model.dart';

abstract class FavoriteRemoteDatasource {
  Future<AddRemoveFavoriteModel> addPlayersToFavorite();
  Future<AddRemoveFavoriteModel> removePlayersToFavorite(
      {required int playerId});
}
