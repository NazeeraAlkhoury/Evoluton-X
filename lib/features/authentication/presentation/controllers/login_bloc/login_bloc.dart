import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/login_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_state.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(const LoginState()) {
    on<TogglePasswordVisibilityEvent>(_togglePassword);
    on<LoginEvent>(_useLogin);
  }

  FutureOr<void> _useLogin(event, emit) async {
    emit(
      state.copyWith(
        loginState: RequestStates.loadingState,
      ),
    );
    final result = await loginUsecase(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            loginState: RequestStates.failureState,
            loginErrMessage: failure.errorMessage,
          ),
        );
      },
      (authResponse) => emit(
        state.copyWith(
          loginState: RequestStates.successState,
          loginAuthResponse: authResponse,
        ),
      ),
    );
  }

  FutureOr<void> _togglePassword(event, emit) {
    emit(
      state.copyWith(isObscurePass: !state.isObscurePass),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
