import 'package:equatable/equatable.dart';

class PasswordEvent extends Equatable {
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

class ValidateOTPEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}
