import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/features/clubs/data/datasource/remote/club_remote_datasource.dart';
import 'package:evoluton_x/features/clubs/data/models/all_clubs_model.dart';
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
}
