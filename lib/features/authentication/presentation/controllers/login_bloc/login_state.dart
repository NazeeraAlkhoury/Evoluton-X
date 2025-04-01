import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

import '../../../../../core/utils/enums.dart';

class LoginState extends Equatable {
  final bool isObscurePass;

  final RequestStates loginState;
  final String loginErrMessage;
  final AuthResponse? loginAuthResponse;
  const LoginState({
    this.isObscurePass = true,
    this.loginState = RequestStates.initialState,
    this.loginAuthResponse,
    this.loginErrMessage = '',
  });
  LoginState copyWith({
    bool? isObscurePass,
    RequestStates? loginState,
    String? loginErrMessage,
    AuthResponse? loginAuthResponse,
  }) =>
      LoginState(
        isObscurePass: isObscurePass ?? this.isObscurePass,
        loginState: loginState ?? this.loginState,
        loginAuthResponse: loginAuthResponse ?? this.loginAuthResponse,
        loginErrMessage: loginErrMessage ?? this.loginErrMessage,
      );
  @override
  List<Object?> get props => [
        isObscurePass,
        loginState,
        loginAuthResponse,
        loginErrMessage,
      ];
}
