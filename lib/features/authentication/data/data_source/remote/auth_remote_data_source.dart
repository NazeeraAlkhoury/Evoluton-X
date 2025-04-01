import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';
import 'package:evoluton_x/features/authentication/data/models/login_params.dart';
import 'package:evoluton_x/features/authentication/data/models/register_params.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register({
    required RegisterParams registerParams,
  });
  Future<AuthResponseModel> verifyEmail({required String code});
  Future<AuthResponseModel> login({required LoginParams loginParams});
  Future<AuthResponseModel> logOut({required String token});
}
