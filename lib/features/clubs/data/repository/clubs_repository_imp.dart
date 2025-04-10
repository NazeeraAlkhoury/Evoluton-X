import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/clubs/data/datasource/remote/club_remote_datasource.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/repository/clubs_repository.dart';

class ClubsRepositoryImp implements ClubsRepository {
  final ClubRemoteDatasource clubRemoteDatasource;

  ClubsRepositoryImp({required this.clubRemoteDatasource});
  @override
  Future<Either<Failure, AllClubs>> getClubs() async {
    try {
      final result = await clubRemoteDatasource.getClubs();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, AllClubs>> getClubsWithFilter(
      {required ClubsFilterParams params}) async {
    try {
      final result = await clubRemoteDatasource.getClubsWithFilter(
          clubsFilterParams: params);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
