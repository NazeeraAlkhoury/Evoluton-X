import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class PasswordState extends Equatable {
  final RequestStates validateOTPState;
  const PasswordState({
    this.validateOTPState = RequestStates.initialState,
  });

  PasswordState copyWith({
    RequestStates? validateOTPState,
  }) =>
      PasswordState(
        validateOTPState: validateOTPState ?? this.validateOTPState,
      );

  @override
  List<Object?> get props => [
        validateOTPState,
      ];
}
