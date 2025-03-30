import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';

import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';

class RegisterUseCase implements BaseUseCases<AuthResponse, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthResponse>> call(RegisterParams params) async {
    return await authRepository.register(
      filePath: params.filePath,
      fileName: params.fileName,
      fname: params.fname,
      lname: params.lname,
      email: params.email,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
    );
  }
}

class RegisterParams extends Equatable {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String fileName;
  final String filePath;

  const RegisterParams(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      required this.fileName,
      required this.filePath});

  @override
  List<Object?> get props => [
        fname,
        lname,
        email,
        password,
        passwordConfirmation,
        fileName,
        filePath,
      ];
}
