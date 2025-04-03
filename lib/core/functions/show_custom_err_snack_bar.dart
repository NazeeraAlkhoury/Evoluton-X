import 'package:evoluton_x/core/widgets/custom_err_message.dart';
import 'package:flutter/material.dart';

SnackBar showCustomErrSnackBar({required String errMessage}) {
  return SnackBar(
    content: CustomErrorMessage(errMessage: errMessage),
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
