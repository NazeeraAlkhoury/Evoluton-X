import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomEvolutonSearchDescription extends StatelessWidget {
  const CustomEvolutonSearchDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.styleRegular12(context),
        children: <TextSpan>[
          TextSpan(
            text: 'With ',
            style: AppTextStyles.styleRegular12(context),
          ),
          TextSpan(
              text: 'Evoluton-X search filter ',
              style: AppTextStyles.styleBold12(context)),
          TextSpan(
            text: 'find any player you want\nin just few seconds.',
            style: AppTextStyles.styleRegular12(context),
          ),
        ],
      ),
    );
  }
}
