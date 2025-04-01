import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';
import 'package:evoluton_x/features/authentication/data/models/reset_pass_params.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required RegisterParams registerParams,
  });
  Future<Either<Failure, AuthResponse>> verifyEmail({required String code});
  Future<Either<Failure, AuthResponse>> resendCode();
  Future<Either<Failure, AuthResponse>> login(
      {required LoginParams loginParams});
  Future<Either<Failure, AuthResponse>> logOut({required String token});
  Future<Either<Failure, AuthResponse>> deleteAccount({required String token});
  Future<Either<Failure, AuthResponse>> forgetPassowrd({required String email});
  Future<Either<Failure, AuthResponse>> resetPassowrd(
      {required ResetPassParams resetPassPArams});
}
