import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

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
