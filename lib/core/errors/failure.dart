import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/network/error_message_model.dart';
import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with the server.');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with the server.');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with the server.');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate from the server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response?.statusCode, dioError.response?.data);
      case DioExceptionType.cancel:
        return const ServerFailure('Request was canceled.');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet connection.');
      case DioExceptionType.unknown:
      default:
        return const ServerFailure('An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return const ServerFailure('Received invalid status code from server.');
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(
            //   'Bad request: ${ErrorMessageModel.fromJson(response).errors.isNotEmpty ? ErrorMessageModel.fromJson(response).errors.join(', ') : 'No specific error message'}',
            // );
            'Bad request: ${ErrorMessageModel.fromJson(response).errors.toString()}');
      case 401:
        return const ServerFailure('Unauthenticated.');
      case 403:
        return ServerFailure(
            AuthResponseModel.fromJson(response).message.toString());
      case 404:
        return const ServerFailure('Record Not Found.');
      case 422:
        final errors = ErrorMessageModel.fromJson(response).errors;
        final errorMessage =
            errors.isNotEmpty ? errors.join(', ') : 'Validation failed';
        return ServerFailure(errorMessage);
      // return ServerFailure(
      //   ErrorMessageModel.fromJson(response).errors.toString(),
      //);
      case 429:
        return const ServerFailure(
            'Too Many Attempts, Retry After One Minute.');
      case 500:
        return const ServerFailure('Internal server error. Please try later.');
      case 503:
        return const ServerFailure('Service unavailable. Try again later.');
      default:
        return ServerFailure('Unexpected error: $statusCode');
    }
  }
}
