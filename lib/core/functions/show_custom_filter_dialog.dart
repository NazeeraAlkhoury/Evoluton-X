import 'package:flutter/material.dart';

Future<dynamic> showCustomFilterDialog(
  BuildContext context, {
  required Widget child,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (context) => child,
  );
}
