import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> showRegisterBottomSheet(
    {required BuildContext context, required Widget widget}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      isDismissible: false,
      enableDrag: false,
      barrierColor: Colors.black.withOpacity(0.7),
      shape: const LinearBorder(),
      backgroundColor: AppColors.whiteColor,
      builder: (context) {
        return widget;
      });
}
