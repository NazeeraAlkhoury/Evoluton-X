import 'package:evoluton_x/features/search/domain/entities/all_players.dart';

abstract class SearchRemoteDatasource {
  Future<AllPlayers> getAllPlayers();
  Future<AllPlayers> search({required String name});
}
