import 'package:evoluton_x/features/authentication/domain/entities/auth_response.dart';

class AuthResponseModel extends AuthResponse {
  const AuthResponseModel({required super.message, super.data});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['msg'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': message,
      'data': data,
    };
  }
}
