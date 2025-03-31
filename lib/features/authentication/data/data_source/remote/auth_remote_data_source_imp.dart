import 'package:evoluton_x/core/network/end_points.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';
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
    print(
        '================================ ${AuthResponseModel.fromJson(response.data)}');
    return AuthResponseModel.fromJson(response.data);
  }
}
