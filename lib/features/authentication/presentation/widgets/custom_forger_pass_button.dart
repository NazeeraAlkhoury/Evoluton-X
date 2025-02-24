import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomForgetPassButton extends StatelessWidget {
  const CustomForgetPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        onPressed: () {},
        child: Text(
          AppStrings.forgetPassword,
          style: AppTextStyles.styleSemiBold10(context).copyWith(
            color: const Color(0xff02A0E4),
          ),
        ),
      ),
    );
  }
}
