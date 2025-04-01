import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibilityEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
