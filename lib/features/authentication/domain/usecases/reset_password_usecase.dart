import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/authentication/data/models/reset_pass_params.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class ResetPasswordUsecase
    implements BaseUseCases<AuthResponse, ResetPassParams> {
  final AuthRepository authRepository;

  ResetPasswordUsecase({required this.authRepository});

  @override
  Future<Either<Failure, AuthResponse>> call(
      ResetPassParams resetPassParams) async {
    return await authRepository.resetPassowrd(resetPassPArams: resetPassParams);
  }
}
