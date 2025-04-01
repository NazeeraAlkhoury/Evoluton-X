import 'package:equatable/equatable.dart';

class ResetPassParams extends Equatable {
  final String code;
  final String password;
  final String passwordConfirmation;

  const ResetPassParams(
      {required this.code,
      required this.password,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'password_confirmation': passwordConfirmation,
      'code': code
    };
  }

  @override
  List<Object?> get props => [
        code,
        password,
        passwordConfirmation,
      ];
}
