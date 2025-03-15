import 'package:evoluton_x/core/utils/app_strings.dart';

String? validateInput(
  String val,
  int min,
  int? max,
  String type,
) {
  if (type == 'password') {
    if (val.isEmpty) {
      return AppStrings.passwordNotEmpty;
    }

    if (val.length < min) {
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
  return null;
}
