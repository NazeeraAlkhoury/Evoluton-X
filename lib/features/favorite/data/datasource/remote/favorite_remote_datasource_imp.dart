import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource.dart';
import 'package:evoluton_x/features/favorite/data/models/add_remove_favorite_model.dart';

class FavoriteRemoteDatasourceImp implements FavoriteRemoteDatasource {
  final ApiServices apiServices;

  FavoriteRemoteDatasourceImp({required this.apiServices});
  @override
  Future<AddRemoveFavoriteModel> addPlayersToFavorite() async {
    final response = await apiServices.sendData(
      path: EndPoints.favorites,
    );

    return AddRemoveFavoriteModel.fromJson(response.data);
  }

  @override
  Future<AddRemoveFavoriteModel> removePlayersToFavorite(
      {required num playerId}) async {
    final response = await apiServices.deleteData(
      path: EndPoints.removeFav(id: playerId),
    );

    return AddRemoveFavoriteModel.fromJson(response.data);
  }
}
