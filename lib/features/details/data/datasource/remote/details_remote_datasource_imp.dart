import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/features/details/data/datasource/remote/details_remote_datasource.dart';
import 'package:evoluton_x/features/details/data/models/details_model.dart';
import 'package:evoluton_x/features/details/data/models/player_details_model.dart';
import 'package:evoluton_x/features/details/data/models/player_statistics.dart';

class DetailsRemoteDatasourceImp implements DetailsRemoteDatasource {
  final ApiServices apiServices;

  DetailsRemoteDatasourceImp({required this.apiServices});

  @override
  Future<DetailsModel> getDetails() async {
    final response = await apiServices.fetchData(
      path: EndPoints.detailsScreen,
      token: AppConstants.tokenSaved!,
    );

    return DetailsModel.fromJson(response.data);
  }

  @override
  Future<PlayerDetailsModel> getPlayerDetails({required int playerId}) async {
    final response = await apiServices.fetchData(
      path: EndPoints.playerDetails(id: playerId),
      token: AppConstants.tokenSaved!,
    );
    return PlayerDetailsModel.fromJson(response.data);
  }

  @override
  Future<PlayerStatisticsModel> getPlayerStatistics(
      {required int playerId}) async {
    final response = await apiServices.fetchData(
      path: EndPoints.playerStatistics(id: playerId),
      token: AppConstants.tokenSaved!,
    );
    return PlayerStatisticsModel.fromJson(response.data);
  }
}
