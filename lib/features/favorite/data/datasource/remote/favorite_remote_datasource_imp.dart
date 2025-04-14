import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource.dart';
import 'package:evoluton_x/features/favorite/data/models/add_remove_favorite_model.dart';
import 'package:evoluton_x/features/favorite/data/models/favorite_model.dart';

class FavoriteRemoteDatasourceImp implements FavoriteRemoteDatasource {
  final ApiServices apiServices;

  FavoriteRemoteDatasourceImp({required this.apiServices});
  @override
  Future<AddRemoveFavoriteModel> addPlayersToFavorite(
      {required int playerId}) async {
    final response = await apiServices.sendData(
      path: EndPoints.favorites,
      token: AppConstants.tokenSaved,
      data: {
        'player_id': playerId,
      },
    );

    return AddRemoveFavoriteModel.fromJson(response.data);
  }

  @override
  Future<AddRemoveFavoriteModel> removePlayersToFavorite(
      {required num playerId}) async {
    final response = await apiServices.deleteData(
      path: EndPoints.removeFav(id: playerId),
      token: AppConstants.tokenSaved,
    );

    return AddRemoveFavoriteModel.fromJson(response.data);
  }

  @override
  Future<FavoriteModel> getFavoritesPlayer() async {
    final response = await apiServices.fetchData(
      path: EndPoints.favorites,
      token: AppConstants.tokenSaved,
    );

    return FavoriteModel.fromJson(response.data);
  }
}
