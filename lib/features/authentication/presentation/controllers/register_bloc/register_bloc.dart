import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_state.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  RegisterBloc() : super(const RegisterState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(
        state.copyWith(isObscurePass: !state.isObscurePass),
      );
    });
    on<ToggleRepeatPasswordVisibilityEvent>((event, emit) {
      emit(
        state.copyWith(isObscureRepPass: !state.isObscureRepPass),
      );
    });
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    return super.close();
  }
}
