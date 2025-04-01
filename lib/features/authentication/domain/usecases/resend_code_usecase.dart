import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class ResendCodeUseCase implements BaseUseCases<AuthResponse, NoParameters> {
  final AuthRepository authRepository;

  ResendCodeUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthResponse>> call(paramas) async {
    return await authRepository.resendCode();
  }
}
