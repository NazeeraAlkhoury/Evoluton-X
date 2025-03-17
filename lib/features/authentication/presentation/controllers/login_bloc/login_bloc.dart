import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
  }
}
