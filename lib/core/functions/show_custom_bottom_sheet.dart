import 'package:flutter/material.dart';

Future<dynamic> showCustomBottomSheet(
  BuildContext context, {
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    elevation: 0,
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 30),
        child: child,
      );
    },
  );
}
