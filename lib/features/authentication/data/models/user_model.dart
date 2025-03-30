import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String passwordConfirmation;
  // final String verificationFileName;

  const UserModel({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    // required this.verificationFileName,
  });
  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      //   'verification_file_name': verificationFileName,
    };
  }

  @override
  List<Object?> get props => [
        fname,
        lname,
        email,
        password,
        passwordConfirmation,
        //  verificationFileName,
      ];
}
