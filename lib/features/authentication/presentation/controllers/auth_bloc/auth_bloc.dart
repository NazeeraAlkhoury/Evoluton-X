import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {}
}
