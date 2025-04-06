import 'package:evoluton_x/features/details/data/models/details_model.dart';
import 'package:evoluton_x/features/details/data/models/player_details_model.dart';
import 'package:evoluton_x/features/details/data/models/player_statistics.dart';

abstract class DetailsRemoteDatasource {
  Future<DetailsModel> getDetails();
  Future<PlayerDetailsModel> getPlayerDetails({required int playerId});
  Future<PlayerStatisticsModel> getPlayerStatistics({required int playerId});
}
