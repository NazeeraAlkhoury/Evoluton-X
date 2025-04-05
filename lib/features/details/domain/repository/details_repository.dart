import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/details/domain/entities/details.dart';

abstract class DetailsRepository {
  Future<Either<Failure, Details>> getDetails();
}
