import 'package:evoluton_x/features/clubs/data/models/club_card_model.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';

abstract class ClubRemoteDatasource {
  Future<AllClubs> getClubs();
  Future<AllClubs> getClubsWithFilter(
      {required ClubsFilterParams clubsFilterParams});
  Future<ClubCardModel> getClubCard({required int clubId});
}
