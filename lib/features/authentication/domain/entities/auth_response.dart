import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String message;
  final String? data;

  const AuthResponse({required this.message, required this.data});

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}
