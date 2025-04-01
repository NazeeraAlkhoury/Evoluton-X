import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/resend_code_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_state.dart';
import 'package:flutter/material.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  List<bool> hasError = List.generate(6, (_) => false);

  final VerifyEmailUseCase verifyEmailUseCase;
  final ResendCodeUseCase resendCodeUseCase;

  VerifyEmailBloc({
    required this.verifyEmailUseCase,
    required this.resendCodeUseCase,
  }) : super(const VerifyEmailState()) {
    on<OnOtpFieldTappedEvent>(_fieldTapped);
    on<OtpFieldChangedEvent>(_fieldChanged);
    on<ValidateOTPEvent>(_validateOtp);
    on<ResendCodeEvent>(
      (event, emit) async {
        emit(state.copyWith(validateOTPState: RequestStates.loadingState));
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
      },
    );
  }
  FutureOr<void> _validateOtp(event, emit) async {
    emit(state.copyWith(validateOTPState: RequestStates.loadingState));
    final result = await verifyEmailUseCase(event.code);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            validateOTPState: RequestStates.failureState,
            errMessage: failure.errorMessage,
          ),
        );
      },
      (authResponse) {
        emit(
          state.copyWith(
            validateOTPState: RequestStates.successState,
            authResponse: authResponse,
          ),
        );
      },
    );
  }

  FutureOr<void> _fieldChanged(event, emit) {
    if (event.value.isNotEmpty) {
      if (event.index < 5) {
        focusNodes[event.index + 1].requestFocus();
      } else {
        focusNodes[event.index].unfocus();
        String enteredCode =
            controllers.map((controller) => controller.text).join();
        add(
          ValidateOTPEvent(code: enteredCode),
        );
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
}
