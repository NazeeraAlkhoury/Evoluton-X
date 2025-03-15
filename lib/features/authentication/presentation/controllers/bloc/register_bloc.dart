import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(
        state.copyWith(isObscurePass: !state.isObscurePass),
      );
    });
    on<ToggleRepeatPasswordVisibilityEvent>((event, emit) {
      emit(
        state.copyWith(isObscureRepPass: !state.isObscureRepPass),
      );
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
