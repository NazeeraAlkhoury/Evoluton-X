import 'package:dio/dio.dart';
import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/features/search/data/datasource/remote/search_remote_datasource.dart';
import 'package:evoluton_x/features/search/data/models/all_players_model.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';

class SearchRemoteDatasourceImp implements SearchRemoteDatasource {
  final ApiServices apiServices;

  SearchRemoteDatasourceImp({required this.apiServices});
  @override
  Future<AllPlayers> getAllPlayers() async {
    final response = await apiServices.fetchData(
      path: EndPoints.players,
      token: AppConstants.tokenSaved,
    );
    return AllPlayersModel.fromJson(response.data);
  }

  @override
  Future<AllPlayers> search({required String name}) async {
    final response = await apiServices.fetchData(
      path: EndPoints.players,
      token: AppConstants.tokenSaved,
      queryParameters: {'name': name},
    );
    if (response.data is Map<String, dynamic>) {
      return AllPlayersModel.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    }
  }
}
