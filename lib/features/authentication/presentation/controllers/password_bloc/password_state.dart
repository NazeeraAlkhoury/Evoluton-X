import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class PasswordState extends Equatable {
  final RequestStates validateOTPState;
  final bool isObscurePass;
  final bool isObscureRepPass;
  const PasswordState({
    this.validateOTPState = RequestStates.initialState,
    this.isObscurePass = true,
    this.isObscureRepPass = true,
  });

  PasswordState copyWith({
    RequestStates? validateOTPState,
    bool? isObscurePass,
    bool? isObscureRepPass,
  }) =>
      PasswordState(
        validateOTPState: validateOTPState ?? this.validateOTPState,
        isObscurePass: isObscurePass ?? this.isObscurePass,
        isObscureRepPass: isObscureRepPass ?? this.isObscureRepPass,
      );

  @override
  List<Object?> get props => [
        validateOTPState,
        isObscurePass,
        isObscureRepPass,
      ];
}
