import 'package:evoluton_x/core/utils/app_strings.dart';

String? validateInput({
  required String val,
  int? min,
  int? max,
  required String type,
  bool? repeatPassword,
}) {
  if (type == 'password') {
    if (val.isEmpty) {
      return AppStrings.passwordNotEmpty;
    }

    if (val.length < min!) {
      return AppStrings.minPassword;
    }

    // if (val.length > max) {
    //   return "Password can't be larger than $max characters";
    // }
    bool isUpperCase = !RegExp(r'(?=.*[A-Z])').hasMatch(val);
    bool isLowerCase = !RegExp(r'(?=.*[a-z])').hasMatch(val);
    bool isSymbol = !RegExp(r'(?=.*[\W_])').hasMatch(val);
    if (isUpperCase || isLowerCase || isSymbol) {
      return AppStrings.passwordTerm;
    }
  }

  if (type == 'email') {
    if (val.isEmpty) {
      return AppStrings.emailNotEmpty;
    }

    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(val)) {
      return AppStrings.notValidEmail;
    }
  }

  if (type == "firstname" || type == "lastname") {
    if (val.isEmpty) {
      return '$type can\'t be empty';
    }
    final nameRegExp = RegExp(r'^[a-zA-Z ]{1,50}$');
    if (!nameRegExp.hasMatch(val)) {
      return "$type Not valid";
    }
  }

  if (type == 'repeatPassword') {
    if (!repeatPassword! || val.isEmpty) {
      return AppStrings.passwordNotMatch;
    }
  }
  return null;
}
