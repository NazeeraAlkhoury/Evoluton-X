import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> register({
    required RegisterParams registerParams,
  }) async {
    try {
      var result = await authRemoteDataSource.register(
        registerParams: registerParams,
      );
      return right(result);
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
  Future<Either<Failure, AuthResponse>> verifyEmail(
      {required String code}) async {
    try {
      var result = await authRemoteDataSource.verifyEmail(code: code);
      return right(result);
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
  Future<Either<Failure, AuthResponse>> login(
      {required LoginParams loginParams}) async {
    try {
      var result = await authRemoteDataSource.login(loginParams: loginParams);
      print('=================== ${result}');
      return right(result);
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
  Future<Either<Failure, AuthResponse>> logOut({required String token}) async {
    try {
      var result = await authRemoteDataSource.logOut(token: token);
      return right(result);
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
  Future<Either<Failure, AuthResponse>> deleteAccount(
      {required String token}) async {
    try {
      var result = await authRemoteDataSource.deleteAccount(token: token);
      return right(result);
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
