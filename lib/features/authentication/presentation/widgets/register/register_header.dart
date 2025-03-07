import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //   mainAxisSize: MainAxisSize.min,
      children: [
        CustomBackButton(
          onTap: () => Navigator.pushNamed(context, AppRoutes.home),
        ),
        Image.asset(
          AppImageAssets.logo,
        ),
        Text(
          AppStrings.register,
          style: AppTextStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
