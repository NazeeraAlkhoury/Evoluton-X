import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isObscurePass;
  const LoginState({
    this.isObscurePass = true,
  });
  LoginState copyWith({
    bool? isObscurePass,
  }) =>
      LoginState(
        isObscurePass: isObscurePass ?? this.isObscurePass,
      );
  @override
  List<Object?> get props => [
        isObscurePass,
      ];
}
