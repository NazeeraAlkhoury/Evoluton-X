import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<Response> uploadFileWithData({
    required String endPoint,
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String verificationFilePath,
    required String verificationFileName,
  }) async {
    FormData formData = FormData.fromMap({
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'verification_file_name': await MultipartFile.fromFile(
          verificationFilePath,
          filename: verificationFileName),
    });

    Response response = await dio.post(
      endPoint,
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
    return response;
  }

  Future<Response> fetchData({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: {}),
    );
    return response;
  }

  Future<Response> sendData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> updateData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> deleteData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }
}
