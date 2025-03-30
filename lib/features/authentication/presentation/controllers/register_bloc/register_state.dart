import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class RegisterState extends Equatable {
  final bool isObscurePass;
  final bool isObscureRepPass;
  final String? selectedFileName;
  final String? selectedFilePath;
  final RequestStates chooseFileRequestState;

  final RequestStates registerState;
  final String registerErrMessage;
  final AuthResponse? authResponse;

  const RegisterState({
    this.isObscurePass = true,
    this.isObscureRepPass = true,
    this.selectedFileName,
    this.selectedFilePath,
    this.chooseFileRequestState = RequestStates.initialState,
    this.registerState = RequestStates.initialState,
    this.authResponse,
    this.registerErrMessage = '',
  });

  RegisterState copyWith({
    bool? isObscurePass,
    bool? isObscureRepPass,
    String? selectedFileName,
    String? selectedFilePath,
    RequestStates? chooseFileRequestState,
    RequestStates? registerState,
    String? registerErrMessage,
    AuthResponse? authResponse,
  }) =>
      RegisterState(
        isObscurePass: isObscurePass ?? this.isObscurePass,
        isObscureRepPass: isObscureRepPass ?? this.isObscureRepPass,
        selectedFileName: selectedFileName ?? this.selectedFileName,
        selectedFilePath: selectedFilePath ?? this.selectedFilePath,
        chooseFileRequestState:
            chooseFileRequestState ?? this.chooseFileRequestState,
        registerState: registerState ?? this.registerState,
        authResponse: authResponse ?? this.authResponse,
        registerErrMessage: registerErrMessage ?? this.registerErrMessage,
      );
  @override
  List<Object?> get props => [
        isObscurePass,
        isObscureRepPass,
        selectedFileName,
        selectedFilePath,
        chooseFileRequestState,
        registerState,
        authResponse,
        registerErrMessage,
      ];
}
