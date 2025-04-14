import 'package:dio/dio.dart';
import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/features/clubs/data/datasource/remote/club_remote_datasource.dart';
import 'package:evoluton_x/features/clubs/data/models/all_clubs_model.dart';
import 'package:evoluton_x/features/clubs/data/models/club_card_model.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';

class ClubRemoteDatasourceImp implements ClubRemoteDatasource {
  final ApiServices apiServices;

  ClubRemoteDatasourceImp({required this.apiServices});
  @override
  Future<AllClubs> getClubs() async {
    final response = await apiServices.fetchData(
      path: EndPoints.clubs,
      token: AppConstants.tokenSaved,
    );
    return AllClubsModel.fromJson(response.data);
  }

  @override
  Future<AllClubs> getClubsWithFilter(
      {required ClubsFilterParams clubsFilterParams}) async {
    final response = await apiServices.fetchData(
      path: EndPoints.clubs,
      token: AppConstants.tokenSaved,
      queryParameters: clubsFilterParams.toJson(),
    );
    if (response.data is Map<String, dynamic>) {
      return AllClubsModel.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    }
  }

  @override
  Future<ClubCardModel> getClubCard({required int clubId}) async {
    final response = await apiServices.fetchData(
      path: EndPoints.clubCard(id: clubId),
      token: AppConstants.tokenSaved,
    );

    return ClubCardModel.fromJson(response.data);
  }
}
