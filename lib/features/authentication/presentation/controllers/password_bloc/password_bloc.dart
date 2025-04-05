import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/data/models/reset_pass_params.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/resend_code_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:flutter/material.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  String? enteredCode;
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  List<bool> hasError = List.generate(6, (_) => false);

  final ForgetPasswordUsecase forgetPasswordUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResendCodeUseCase resendCodeUseCase;
  PasswordBloc({
    required this.forgetPasswordUsecase,
    required this.resetPasswordUsecase,
    required this.verifyEmailUseCase,
    required this.resendCodeUseCase,
  }) : super(const PasswordState()) {
    on<OnOtpFieldTappedEvent>(_fieldTapped);
    on<OtpFieldChangedEvent>(_fieldChanged);
    on<TogglePasswordVisibilityEvent>(_togglePassword);
    on<ToggleRepeatPasswordVisibilityEvent>(_toggleRepeatPassword);
    on<ForgetPasswordEvent>(_forgetPassword);
    on<ResetPasswordEvent>(_resetPassword);
    on<ResendCodeEvent>(_resendCode);
    on<ResetPasswordValueEvent>(_resetPass);
  }

  FutureOr<void> _resetPass(event, emit) => emit(
        state.copyWith(
          forgetPassState: RequestStates.initialState,
          resendCodeState: RequestStates.initialState,
        ),
      );

  FutureOr<void> _resendCode(event, emit) async {
    final result = await resendCodeUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            resendCodeState: RequestStates.failureState,
            resendCodeErrMessage: failure.errorMessage,
          ),
        );
      },
      (authResponse) {
        emit(
          state.copyWith(
            resendCodeState: RequestStates.successState,
            resendCodeauthResponse: authResponse,
          ),
        );
      },
    );
  }

  FutureOr<void> _resetPassword(event, emit) async {
    emit(
      state.copyWith(
        resetPassState: RequestStates.loadingState,
      ),
    );
    final result = await resetPasswordUsecase(ResetPassParams(
      code: enteredCode!,
      password: passwordController.text,
      passwordConfirmation: repeatPasswordController.text,
    ));

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            resetPassState: RequestStates.failureState,
            resetPassErrMessage: failure.errorMessage,
          ),
        );
      },
      (authResponse) => emit(
        state.copyWith(
          resetPassState: RequestStates.successState,
          resetPassAuthResponse: authResponse,
        ),
      ),
    );
  }

  FutureOr<void> _forgetPassword(event, emit) async {
    emit(
      state.copyWith(
        forgetPassState: RequestStates.loadingState,
      ),
    );
    final result = await forgetPasswordUsecase(emailController.text);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            forgetPassState: RequestStates.failureState,
            forgetPassErrMessage: failure.errorMessage,
          ),
        );
      },
      (authResponse) => emit(
        state.copyWith(
          forgetPassState: RequestStates.successState,
          forgetPAssAuthResponse: authResponse,
        ),
      ),
    );
  }

  FutureOr<void> _fieldChanged(event, emit) {
    if (event.value.isNotEmpty) {
      if (event.index < 5) {
        focusNodes[event.index + 1].requestFocus();
      } else {
        focusNodes[event.index].unfocus();
        enteredCode = controllers.map((controller) => controller.text).join();
      }
    } else if (event.index > 0) {
      focusNodes[event.index - 1].requestFocus();
    }
  }

  FutureOr<void> _fieldTapped(event, emit) {
    controllers[event.index].selection = TextSelection.fromPosition(
      TextPosition(offset: controllers[event.index].text.length),
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
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();

    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    return super.close();
  }
}
