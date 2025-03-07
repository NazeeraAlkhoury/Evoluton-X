import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomBackButton(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeAfterChecked);
          },
        ),
        Image.asset(
          AppImageAssets.logo,
        ),
        Text(
          AppStrings.welcomeBack,
          style: AppTextStyles.styleSemiBold18(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
