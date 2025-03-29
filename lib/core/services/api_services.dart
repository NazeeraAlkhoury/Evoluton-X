import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

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
