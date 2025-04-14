import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card.dart';

abstract class ClubsRepository {
  Future<Either<Failure, AllClubs>> getClubs();
  Future<Either<Failure, AllClubs>> getClubsWithFilter(
      {required ClubsFilterParams params});
  Future<Either<Failure, ClubCard>> getClubCard({required int clubId});
}
