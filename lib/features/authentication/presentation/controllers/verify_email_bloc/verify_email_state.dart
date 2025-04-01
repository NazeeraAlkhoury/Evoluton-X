import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class VerifyEmailState extends Equatable {
  final RequestStates validateOTPState;
  final String errMessage;
  final AuthResponse? authResponse;

  final RequestStates resendCodeState;
  final String resendCodeErrMessage;
  final AuthResponse? resendCodeauthResponse;
  const VerifyEmailState({
    this.validateOTPState = RequestStates.initialState,
    this.errMessage = '',
    this.authResponse,
    this.resendCodeState = RequestStates.initialState,
    this.resendCodeErrMessage = '',
    this.resendCodeauthResponse,
  });
  VerifyEmailState copyWith({
    RequestStates? validateOTPState,
    String? errMessage,
    AuthResponse? authResponse,
    RequestStates? resendCodeState,
    String? resendCodeErrMessage,
    AuthResponse? resendCodeauthResponse,
  }) =>
      VerifyEmailState(
        validateOTPState: validateOTPState ?? this.validateOTPState,
        errMessage: errMessage ?? this.errMessage,
        authResponse: authResponse ?? this.authResponse,
        resendCodeState: resendCodeState ?? this.resendCodeState,
        resendCodeErrMessage: resendCodeErrMessage ?? this.resendCodeErrMessage,
        resendCodeauthResponse:
            resendCodeauthResponse ?? this.resendCodeauthResponse,
      );
  @override
  List<Object?> get props => [
        validateOTPState,
        errMessage,
        authResponse,
        resendCodeState,
        resendCodeErrMessage,
        resendCodeauthResponse,
      ];
}
