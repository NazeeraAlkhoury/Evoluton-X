import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUsecase logoutUsecase;
  AuthBloc({required this.logoutUsecase}) : super(const AuthState()) {
    on<LogoutEvent>(
      (event, emit) async {
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
      },
    );
  }
}
