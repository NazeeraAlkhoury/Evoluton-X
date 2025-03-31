import 'package:equatable/equatable.dart';

// class ErrorMessageModel extends Equatable {
//   final List<String> errors;

//   const ErrorMessageModel({required this.errors});

//   factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
//     // التأكد من أن الأخطاء ليست فارغة أو null
//     if (json['errors'] == null || (json['errors'] as List).isEmpty) {
//       return const ErrorMessageModel(errors: ['Unknown error occurred']);
//     }
//     return ErrorMessageModel(
//       errors: List<String>.from(json['errors'].map((e) => e).toList()),
//     );
//   }

//   @override
//   List<Object?> get props => [errors];
// }
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
  // final String message;

  // const ErrorMessageModel({required this.message});

  // factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
  //     ErrorMessageModel(
  //       message: json['message'] ?? 'Unknown error',
  //     );

  // @override
  // List<Object?> get props => [message];
// }
