import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/login_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/register_usecase.dart';
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
  final RegisterUseCase registerUseCase;
  final LoginUsecase loginUsecase;

  RegisterBloc({required this.registerUseCase, required this.loginUsecase})
      : super(const RegisterState()) {
    on<TogglePasswordVisibilityEvent>(_togglePassword);
    on<ToggleRepeatPasswordVisibilityEvent>(_toggleRepeatPassword);
    on<ChooseDocumentEvent>(_chooseDocument);
    on<RegisterWithUploadFileEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            registerState: RequestStates.loadingState,
          ),
        );

        final result = await registerUseCase(
          RegisterParams(
            filePath: event.filePath,
            fileName: event.fileName,
            fname: firstNameController.text,
            lname: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            passwordConfirmation: repeatPasswordController.text,
          ),
        );
        result.fold(
          (failure) {
            emit(
              state.copyWith(
                registerState: RequestStates.failureState,
                registerErrMessage: failure.errorMessage,
              ),
            );
            // ignore: avoid_print
            print(
                '========================================== ${state.registerState}');
          },
          (authResponse) => emit(
            state.copyWith(
              registerState: RequestStates.successState,
              authResponse: authResponse,
            ),
          ),
        );
      },
    );

    on<LoginEvent>(
      (event, emit) async {
        final result = await loginUsecase(
          LoginParams(
            email: 'nazeeramkhoury@gmail.com',
            // emailController.text,
            password: 'Nazeera@1234',
            // passwordController.text,
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
      },
    );
  }

  FutureOr<void> _chooseDocument(event, emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.name != state.selectedFileName) {
      emit(
        state.copyWith(
          selectedFileName: result.files.single.name,
          selectedFilePath: result.files.single.path,
          chooseFileRequestState: RequestStates.successState,
        ),
      );
    }
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
