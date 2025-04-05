import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/details/data/datasource/remote/details_remote_datasource.dart';
import 'package:evoluton_x/features/details/domain/entities/details.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';

class DetailsRepositoryImp implements DetailsRepository {
  final DetailsRemoteDatasource detailsRemoteDatasource;

  DetailsRepositoryImp({required this.detailsRemoteDatasource});
  @override
  Future<Either<Failure, Details>> getDetails() async {
    try {
      final result = await detailsRemoteDatasource.getDetails();
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
