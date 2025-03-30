import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> register({
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String fileName,
    required String filePath,
  }) async {
    try {
      var result = await authRemoteDataSource.register(
        filePath: filePath,
        fileName: fileName,
        fname: fname,
        lname: lname,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
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
}
