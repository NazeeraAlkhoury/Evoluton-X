import 'package:dio/dio.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<Response> uploadFileWithData({
    required String endPoint,
    required RegisterParams registerParams,
  }) async {
    FormData formData = FormData.fromMap({
      'fname': registerParams.fname,
      'lname': registerParams.lname,
      'email': registerParams.email,
      'password': registerParams.password,
      'password_confirmation': registerParams.passwordConfirmation,
      'verification_file_name': await MultipartFile.fromFile(
        registerParams.filePath,
        filename: registerParams.fname,
      ),
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
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
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
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    return response;
  }

  Future<Response> deleteData({
    required String path,
    String? token,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    return response;
  }
}
