import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final List<String> errors;

  const ErrorMessageModel({required this.errors});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        errors: List<String>.from(json['errors']
            .map(
              (e) => e,
            )
            .toList()),
      );
  @override
  List<Object?> get props => [errors];
}
