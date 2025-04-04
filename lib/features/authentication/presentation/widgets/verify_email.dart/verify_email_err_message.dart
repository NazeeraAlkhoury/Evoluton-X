import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class VerifyEmailErrMessage extends StatelessWidget {
  final String errMessage;
  const VerifyEmailErrMessage({
    super.key,
    required this.errMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 4, left: 15),
      child: Text(
        errMessage,
        style: AppTextStyles.styleRegular12(context).copyWith(
          color: AppColors.redColor,
        ),
      ),
    );
  }
}
