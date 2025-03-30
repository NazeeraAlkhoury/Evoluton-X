import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSourceImp({required this.apiServices});
  @override
  Future<AuthResponseModel> register({
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String fileName,
    required String filePath,
  }) async {
    final response = await apiServices.uploadFileWithData(
      endPoint: EndPoints.register,
      fname: fname,
      lname: lname,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      verificationFileName: fileName,
      verificationFilePath: filePath,
    );
    print(
        '================================ ${AuthResponseModel.fromJson(response.data)}');
    return AuthResponseModel.fromJson(response.data);
  }
}
