import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class AuthState extends Equatable {
  final RequestStates logoutState;
  final String logoutErrMessag;
  final AuthResponse? logoutAuthResponse;

  final RequestStates deleteAccountState;
  final String deleteAccountMessag;
  final AuthResponse? deleteAccountAuthResponse;

  const AuthState({
    this.logoutState = RequestStates.initialState,
    this.logoutErrMessag = '',
    this.logoutAuthResponse,
    this.deleteAccountState = RequestStates.initialState,
    this.deleteAccountMessag = '',
    this.deleteAccountAuthResponse,
  });
  AuthState copyWith({
    RequestStates? logoutState,
    String? logoutErrMessag,
    AuthResponse? logoutAuthResponse,
    RequestStates? deleteAccountState,
    String? deleteAccountMessag,
    AuthResponse? deleteAccountAuthResponse,
  }) =>
      AuthState(
        logoutState: logoutState ?? this.logoutState,
        logoutErrMessag: logoutErrMessag ?? this.logoutErrMessag,
        logoutAuthResponse: logoutAuthResponse ?? this.logoutAuthResponse,
        deleteAccountState: deleteAccountState ?? this.deleteAccountState,
        deleteAccountMessag: deleteAccountMessag ?? this.deleteAccountMessag,
        deleteAccountAuthResponse:
            deleteAccountAuthResponse ?? this.deleteAccountAuthResponse,
      );
  @override
  List<Object?> get props => [
        logoutState,
        logoutErrMessag,
        logoutAuthResponse,
        deleteAccountState,
        deleteAccountMessag,
        deleteAccountAuthResponse,
      ];
}
