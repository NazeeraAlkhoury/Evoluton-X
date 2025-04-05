import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class PasswordState extends Equatable {
  final bool isObscurePass;
  final bool isObscureRepPass;

  final RequestStates forgetPassState;
  final String forgetPassErrMessage;
  final AuthResponse? forgetPAssAuthResponse;

  final RequestStates resetPassState;
  final String resetPassErrMessage;
  final AuthResponse? resetPassAuthResponse;

  final RequestStates resendCodeState;
  final String resendCodeErrMessage;
  final AuthResponse? resendCodeauthResponse;
  const PasswordState({
    this.isObscurePass = true,
    this.isObscureRepPass = true,
    this.forgetPassState = RequestStates.initialState,
    this.forgetPassErrMessage = '',
    this.forgetPAssAuthResponse,
    this.resetPassState = RequestStates.initialState,
    this.resetPassErrMessage = '',
    this.resetPassAuthResponse,
    this.resendCodeState = RequestStates.initialState,
    this.resendCodeErrMessage = '',
    this.resendCodeauthResponse,
  });

  PasswordState copyWith({
    bool? isObscurePass,
    bool? isObscureRepPass,
    RequestStates? forgetPassState,
    String? forgetPassErrMessage,
    AuthResponse? forgetPAssAuthResponse,
    RequestStates? resetPassState,
    String? resetPassErrMessage,
    AuthResponse? resetPassAuthResponse,
    RequestStates? resendCodeState,
    String? resendCodeErrMessage,
    AuthResponse? resendCodeauthResponse,
  }) =>
      PasswordState(
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
        resendCodeState: resendCodeState ?? this.resendCodeState,
        resendCodeErrMessage: resendCodeErrMessage ?? this.resendCodeErrMessage,
        resendCodeauthResponse:
            resendCodeauthResponse ?? this.resendCodeauthResponse,
      );

  @override
  List<Object?> get props => [
        isObscurePass,
        isObscureRepPass,
        forgetPassState,
        forgetPassErrMessage,
        forgetPAssAuthResponse,
        resetPassState,
        resetPassErrMessage,
        resetPassAuthResponse,
        resendCodeState,
        resendCodeErrMessage,
        resendCodeauthResponse,
      ];
}
