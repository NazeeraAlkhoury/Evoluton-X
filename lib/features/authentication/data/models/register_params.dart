import 'package:equatable/equatable.dart';

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
