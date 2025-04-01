import 'package:equatable/equatable.dart';

class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();

  @override
  List<Object?> get props => [];
}

class OnOtpFieldTappedEvent extends VerifyEmailEvent {
  final int index;

  const OnOtpFieldTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class OtpFieldChangedEvent extends VerifyEmailEvent {
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

class ValidateOTPEvent extends VerifyEmailEvent {
  final String code;

  const ValidateOTPEvent({required this.code});
  @override
  List<Object?> get props => [code];
}
