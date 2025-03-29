import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  RegisterBloc() : super(const RegisterState()) {
    on<TogglePasswordVisibilityEvent>(_togglePassword);
    on<ToggleRepeatPasswordVisibilityEvent>(_toggleRepeatPassword);
    on<ChooseDocumentEvent>(
      (event, emit) async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null &&
            result.files.single.name != state.selectedFileName) {
          //    String filePath = result.files.single.path!;
          //    String fileName = result.files.single.name;
          emit(
            state.copyWith(
              selectedFileName: result.files.single.name,
              chooseFileRequestState: RequestStates.successState,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _toggleRepeatPassword(event, emit) {
    emit(
      state.copyWith(isObscureRepPass: !state.isObscureRepPass),
    );
  }

  FutureOr<void> _togglePassword(event, emit) {
    emit(
      state.copyWith(isObscurePass: !state.isObscurePass),
    );
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
