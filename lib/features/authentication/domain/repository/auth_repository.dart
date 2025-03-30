import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String fileName,
    required String filePath,
  });
}
