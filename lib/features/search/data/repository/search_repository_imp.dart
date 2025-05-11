import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/search/data/datasource/remote/search_remote_datasource.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';
import 'package:evoluton_x/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchRemoteDatasource searchRemoteDatasource;

  SearchRepositoryImp({required this.searchRemoteDatasource});
  @override
  Future<Either<Failure, AllPlayers>> getAllPlayers() async {
    try {
      final result = await searchRemoteDatasource.getAllPlayers();
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
  Future<Either<Failure, AllPlayers>> search({required String name}) async {
    try {
      final result = await searchRemoteDatasource.search(name: name);
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
