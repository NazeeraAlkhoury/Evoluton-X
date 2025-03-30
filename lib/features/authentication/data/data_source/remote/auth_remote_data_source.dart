import 'package:evoluton_x/features/authentication/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register({
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String fileName,
    required String filePath,
  });
}
