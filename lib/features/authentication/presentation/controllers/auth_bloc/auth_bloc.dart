import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/delete_account_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUsecase logoutUsecase;
  final DeleteAccountUsecase deleteAccountUsecase;
  AuthBloc({
    required this.logoutUsecase,
    required this.deleteAccountUsecase,
  }) : super(const AuthState()) {
    on<LogoutEvent>(_logout);
    on<LogoutEvent>(_deleteAccount);
  }

  FutureOr<void> _deleteAccount(event, emit) async {
    final result = await deleteAccountUsecase(event.token);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            deleteAccountState: RequestStates.failureState,
            deleteAccountMessag: failure.errorMessage,
          ),
        );
      },
      (authResponse) => emit(
        state.copyWith(
          deleteAccountState: RequestStates.successState,
          deleteAccountAuthResponse: authResponse,
        ),
      ),
    );
  }

  FutureOr<void> _logout(event, emit) async {
    final result = await logoutUsecase(event.token);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            logoutState: RequestStates.failureState,
            logoutErrMessag: failure.errorMessage,
          ),
        );
      },
      (authResponse) => emit(
        state.copyWith(
          logoutState: RequestStates.successState,
          logoutAuthResponse: authResponse,
        ),
      ),
    );
  }
}
