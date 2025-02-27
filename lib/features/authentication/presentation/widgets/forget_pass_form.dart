import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPassForm extends StatelessWidget {
  const ForgetPassForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.enterEmailForConfirmation,
            style: AppTextStyles.styleSemiBold16(context),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppStrings.email,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.enterEmail,
            prefixIcon: AppIconAssets.mail,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 60),
          AppButton(
            textButton: AppStrings.login,
            widthButton: double.infinity,
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.resetPassword);
            },
          ),
        ],
      ),
    );
  }
}
