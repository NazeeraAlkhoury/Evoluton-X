import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/core/widgets/bottomsheet_handle.dart';
import 'package:flutter/material.dart';

class PasswordChangedSuccessSheet extends StatelessWidget {
  const PasswordChangedSuccessSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHandle(),
        const SizedBox(
          height: 30,
        ),
        Image.asset(AppImageAssets.changePassSuccess),
        const SizedBox(
          height: 60,
        ),
        Text(
          AppStrings.passwordChangedSuccessfully,
          textAlign: TextAlign.center,
          style: AppTextStyles.styleSemiBold18(context),
        ),
        const SizedBox(
          height: 50,
        ),
        AppButton(
          textButton: AppStrings.loginNow,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        ),
      ],
    );
  }
}
