// ignore_for_file: avoid_print

import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSourceImp({required this.apiServices});
  @override
  Future<AuthResponseModel> register({
    required RegisterParams registerParams,
  }) async {
    final response = await apiServices.uploadFileWithData(
      endPoint: EndPoints.register,
      registerParams: registerParams,
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> verifyEmail({required String code}) async {
    final response =
        await apiServices.updateData(path: EndPoints.verifyEmail, data: {
      'code': code,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> login({required LoginParams loginParams}) async {
    print('=================== ');
    final response = await apiServices.sendData(
      path: EndPoints.login,
      data: loginParams.toJson(),
    );
    print('=================== ${response.data}');
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> logOut({required String token}) async {
    final response = await apiServices.deleteData(
      path: EndPoints.logOut,
      token: token,
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> deleteAccount({required String token}) async {
    final response = await apiServices.deleteData(
      path: EndPoints.deleteAccount,
      token: token,
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> forgetPassword({required String email}) async {
    final response = await apiServices
        .sendData(path: EndPoints.forgetPassword, data: {'email': email});
    return AuthResponseModel.fromJson(response.data);
  }
}
