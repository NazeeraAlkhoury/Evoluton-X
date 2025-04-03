import 'package:evoluton_x/core/widgets/custom_err_message.dart';
import 'package:flutter/material.dart';

void showCustomErrSnackBar(
    {required BuildContext context, required String errMessage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomErrorMessage(errMessage: errMessage),
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
