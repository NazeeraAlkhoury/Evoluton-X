import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

import '../../../../../core/utils/enums.dart';

class LoginState extends Equatable {
  final RequestStates seenPassState;
  final bool isObscurePass;

  final RequestStates loginState;
  final String loginErrMessage;
  final AuthResponse? loginAuthResponse;
  const LoginState({
    this.seenPassState = RequestStates.initialState,
    this.isObscurePass = true,
    this.loginState = RequestStates.initialState,
    this.loginAuthResponse,
    this.loginErrMessage = '',
  });
  LoginState copyWith({
    RequestStates? seenPassState,
    bool? isObscurePass,
    RequestStates? loginState,
    String? loginErrMessage,
    AuthResponse? loginAuthResponse,
  }) =>
      LoginState(
        seenPassState: seenPassState ?? this.seenPassState,
        isObscurePass: isObscurePass ?? this.isObscurePass,
        loginState: loginState ?? this.loginState,
        loginAuthResponse: loginAuthResponse ?? this.loginAuthResponse,
        loginErrMessage: loginErrMessage ?? this.loginErrMessage,
      );
  @override
  List<Object?> get props => [
        seenPassState,
        isObscurePass,
        loginState,
        loginAuthResponse,
        loginErrMessage,
      ];
}
