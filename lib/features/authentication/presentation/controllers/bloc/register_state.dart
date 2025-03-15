import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isObscurePass;
  final bool isObscureRepPass;
  const RegisterState(
      {this.isObscurePass = true, this.isObscureRepPass = true});

  RegisterState copyWith({
    bool? isObscurePass,
    bool? isObscureRepPass,
  }) =>
      RegisterState(
        isObscurePass: isObscurePass ?? this.isObscurePass,
        isObscureRepPass: isObscureRepPass ?? this.isObscureRepPass,
      );
  @override
  List<Object> get props => [
        isObscurePass,
        isObscureRepPass,
      ];
}
