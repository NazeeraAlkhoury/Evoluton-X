import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibilityEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class ToggleRepeatPasswordVisibilityEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class ChooseDocumentEvent extends RegisterEvent {
  // final FilePickerResult? result;

  // const ChooseDocumentEvent({required this.result});
  @override
  List<Object?> get props => [];
}

class RegisterWithUploadFileEvent extends RegisterEvent {
  final String filePath;
  final String fileName;

  const RegisterWithUploadFileEvent({
    required this.filePath,
    required this.fileName,
  });
  @override
  List<Object?> get props => [filePath, fileName];
}
