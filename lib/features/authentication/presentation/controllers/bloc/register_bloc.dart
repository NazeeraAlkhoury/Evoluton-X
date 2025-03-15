import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {});
  }
}
