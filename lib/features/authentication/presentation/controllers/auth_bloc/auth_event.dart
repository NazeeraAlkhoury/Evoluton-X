import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthEvent {
  final String token;

  const LogoutEvent({required this.token});
}

class DeletAccountEvent extends AuthEvent {
  final String token;

  const DeletAccountEvent({required this.token});
}
