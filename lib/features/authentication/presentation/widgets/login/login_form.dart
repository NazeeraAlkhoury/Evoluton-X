import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login/custom_forger_pass_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.email,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.enterEmail,
            prefixIcon: AppIconAssets.user,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.password,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.yourPassword,
            prefixIcon: AppIconAssets.key,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: AppIconAssets.visibilityOff,
            isObscureText: true,
          ),
          const CustomForgetPassButton(),
          const SizedBox(height: 60),
          AppButton(
            textButton: AppStrings.login,
            widthButton: double.infinity,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
