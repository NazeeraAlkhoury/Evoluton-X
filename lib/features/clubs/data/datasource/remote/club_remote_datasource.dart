import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';

abstract class ClubRemoteDatasource {
  Future<AllClubs> getClubs();
}
