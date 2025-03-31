import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required RegisterParams registerParams,
  });
}
