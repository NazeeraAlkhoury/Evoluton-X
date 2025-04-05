import 'package:equatable/equatable.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object?> get props => [];
}

class OnOtpFieldTappedEvent extends PasswordEvent {
  final int index;

  const OnOtpFieldTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class OtpFieldChangedEvent extends PasswordEvent {
  final int index;
  final String value;

  const OtpFieldChangedEvent({
    required this.index,
    required this.value,
  });

  @override
  List<Object?> get props => [
        index,
        value,
      ];
}

class TogglePasswordVisibilityEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class ToggleRepeatPasswordVisibilityEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class ResetPasswordEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class ResendCodeEvent extends PasswordEvent {
  const ResendCodeEvent();
  @override
  List<Object?> get props => [];
}

class ResetPasswordValueEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}
