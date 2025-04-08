import 'package:evoluton_x/features/players/data/models/details_model.dart';
import 'package:evoluton_x/features/players/data/models/player_details_model.dart';
import 'package:evoluton_x/features/players/data/models/player_statistics.dart';
import 'package:evoluton_x/features/players/data/models/prediction_result_model.dart';

abstract class PlayerRemoteDatasource {
  Future<DetailsModel> getDetails();
  Future<PlayerDetailsModel> getPlayerDetails({required int playerId});
  Future<PlayerStatisticsModel> getPlayerStatistics({required int playerId});
  Future<PredictionResultModel> getPredictionResult({required int playerId});
}
