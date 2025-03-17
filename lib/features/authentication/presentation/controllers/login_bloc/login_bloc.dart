import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_state.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc() : super(const LoginState()) {
    on<TogglePasswordVisibilityEvent>(_togglePassword);
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
