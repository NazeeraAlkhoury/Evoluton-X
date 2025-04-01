import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class AuthState extends Equatable {
  final RequestStates logoutState;
  final String logoutErrMessag;
  final AuthResponse? logoutAuthResponse;

  const AuthState({
    this.logoutState = RequestStates.initialState,
    this.logoutErrMessag = '',
    this.logoutAuthResponse,
  });
  AuthState copyWith({
    RequestStates? logoutState,
    String? logoutErrMessag,
    AuthResponse? logoutAuthResponse,
  }) =>
      AuthState(
        logoutState: logoutState ?? this.logoutState,
        logoutErrMessag: logoutErrMessag ?? this.logoutErrMessag,
        logoutAuthResponse: logoutAuthResponse ?? this.logoutAuthResponse,
      );
  @override
  List<Object?> get props => [
        logoutState,
        logoutErrMessag,
        logoutAuthResponse,
      ];
}
