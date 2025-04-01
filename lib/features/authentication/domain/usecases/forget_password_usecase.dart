import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class ForgetPasswordUsecase implements BaseUseCases<AuthResponse, String> {
  final AuthRepository authRepository;

  ForgetPasswordUsecase({required this.authRepository});

  @override
  Future<Either<Failure, AuthResponse>> call(String email) async {
    return await authRepository.forgetPassowrd(email: email);
  }
}
