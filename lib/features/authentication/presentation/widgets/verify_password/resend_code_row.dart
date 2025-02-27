import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResndCodeRow extends StatelessWidget {
  const ResndCodeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.codeNotArrived,
          style: AppTextStyles.styleRegular14(context),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.resendCode,
            style: AppTextStyles.styleRegular12(context).copyWith(
              color: const Color(0xff0896D6),
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xff0896D6),
            ),
          ),
        ),
      ],
    );
  }
}
