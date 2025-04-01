import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/data/models/reset_pass_params.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:flutter/material.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  List<bool> hasError = List.generate(4, (_) => false);

  final ForgetPasswordUsecase forgetPasswordUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  PasswordBloc({
    required this.forgetPasswordUsecase,
    required this.resetPasswordUsecase,
  }) : super(const PasswordState()) {
    on<OnOtpFieldTappedEvent>(_fieldTapped);
    on<OtpFieldChangedEvent>(_fieldChanged);
    on<ValidateOTPEvent>(_validateOtp);
    on<TogglePasswordVisibilityEvent>(_togglePassword);
    on<ToggleRepeatPasswordVisibilityEvent>(_toggleRepeatPassword);
    on<ForgetPasswordEvent>(
      (event, emit) async {
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
      },
    );
    on<ResetPasswordEvent>(
      (event, emit) async {
        final result = await resetPasswordUsecase(ResetPassParams(
          code: '123456',
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
      },
    );
  }

  FutureOr<void> _validateOtp(event, emit) {
    String enteredOTP = controllers.map((controller) => controller.text).join();

    if (enteredOTP == "1234") {
      hasError.fillRange(0, 4, false);
      emit(
        state.copyWith(
          validateOTPState: RequestStates.successState,
        ),
      );
    } else {
      hasError.fillRange(0, 4, true);
      emit(
        state.copyWith(
          validateOTPState: RequestStates.failureState,
        ),
      );
    }
  }

  FutureOr<void> _fieldChanged(event, emit) {
    if (event.value.isNotEmpty) {
      if (event.index < 3) {
        focusNodes[event.index + 1].requestFocus();
      } else {
        focusNodes[event.index].unfocus();
        add(ValidateOTPEvent());
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
