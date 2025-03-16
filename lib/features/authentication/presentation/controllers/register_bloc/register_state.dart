import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class RegisterState extends Equatable {
  final bool isObscurePass;
  final bool isObscureRepPass;
  final String? selectedFileName;
  final RequestStates chooseFileRequestState;

  const RegisterState({
    this.isObscurePass = true,
    this.isObscureRepPass = true,
    this.selectedFileName,
    this.chooseFileRequestState = RequestStates.initialState,
  });

  RegisterState copyWith({
    bool? isObscurePass,
    bool? isObscureRepPass,
    String? selectedFileName,
    RequestStates? chooseFileRequestState,
  }) =>
      RegisterState(
        isObscurePass: isObscurePass ?? this.isObscurePass,
        isObscureRepPass: isObscureRepPass ?? this.isObscureRepPass,
        selectedFileName: selectedFileName ?? this.selectedFileName,
        chooseFileRequestState:
            chooseFileRequestState ?? this.chooseFileRequestState,
      );
  @override
  List<Object?> get props => [
        isObscurePass,
        isObscureRepPass,
        selectedFileName,
        chooseFileRequestState,
      ];
}
