import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class PasswordState extends Equatable {
  final RequestStates validateOTPState;
  final bool isObscurePass;
  final bool isObscureRepPass;

  final RequestStates forgetPassState;
  final String forgetPassErrMessage;
  final AuthResponse? forgetPAssAuthResponse;

  final RequestStates resetPassState;
  final String resetPassErrMessage;
  final AuthResponse? resetPassAuthResponse;
  const PasswordState({
    this.validateOTPState = RequestStates.initialState,
    this.isObscurePass = true,
    this.isObscureRepPass = true,
    this.forgetPassState = RequestStates.initialState,
    this.forgetPassErrMessage = '',
    this.forgetPAssAuthResponse,
    this.resetPassState = RequestStates.initialState,
    this.resetPassErrMessage = '',
    this.resetPassAuthResponse,
  });

  PasswordState copyWith({
    RequestStates? validateOTPState,
    bool? isObscurePass,
    bool? isObscureRepPass,
    RequestStates? forgetPassState,
    String? forgetPassErrMessage,
    AuthResponse? forgetPAssAuthResponse,
    RequestStates? resetPassState,
    String? resetPassErrMessage,
    AuthResponse? resetPassAuthResponse,
  }) =>
      PasswordState(
        validateOTPState: validateOTPState ?? this.validateOTPState,
        isObscurePass: isObscurePass ?? this.isObscurePass,
        isObscureRepPass: isObscureRepPass ?? this.isObscureRepPass,
        forgetPassState: forgetPassState ?? this.forgetPassState,
        forgetPassErrMessage: forgetPassErrMessage ?? this.forgetPassErrMessage,
        forgetPAssAuthResponse:
            forgetPAssAuthResponse ?? this.forgetPAssAuthResponse,
        resetPassState: resetPassState ?? this.resetPassState,
        resetPassErrMessage: resetPassErrMessage ?? this.resetPassErrMessage,
        resetPassAuthResponse:
            resetPassAuthResponse ?? this.resetPassAuthResponse,
      );

  @override
  List<Object?> get props => [
        validateOTPState,
        isObscurePass,
        isObscureRepPass,
        forgetPassState,
        forgetPassErrMessage,
        forgetPAssAuthResponse,
        resetPassState,
        resetPassErrMessage,
        resetPassAuthResponse,
      ];
}
