import 'package:evoluton_x/core/functions/show_custom_bottom_sheet.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/password_changed_success_sheet.dart';
import 'package:flutter/material.dart';

class ResetPassForm extends StatefulWidget {
  const ResetPassForm({super.key});

  @override
  State<ResetPassForm> createState() => _ResetPassFormState();
}

class _ResetPassFormState extends State<ResetPassForm> {
  bool isObscurePass = true;
  bool isObscureRepPass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.newPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: AppStrings.enterNewPassword,
            prefixIcon: AppIconAssets.key,
            isObscureText: isObscurePass,
            suffixIcon: isObscurePass
                ? AppIconAssets.visibilityOff
                : AppIconAssets.visibility,
            keyboardType: TextInputType.visiblePassword,
            onSuffix: () => setState(() {
              isObscurePass = !isObscurePass;
            }),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.confirmPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: AppStrings.confirmit,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: AppIconAssets.key,
            isObscureText: isObscureRepPass,
            suffixIcon: isObscureRepPass
                ? AppIconAssets.visibilityOff
                : AppIconAssets.visibility,
            onSuffix: () => setState(() {
              isObscureRepPass = !isObscureRepPass;
            }),
          ),
          const SizedBox(height: 60),
          AppButton(
              textButton: AppStrings.login,
              widthButton: double.infinity,
              onPressed: () {
                showCustomBottomSheet(context,
                    child: const PasswordChangedSuccessSheet());
              }),
        ],
      ),
    );
  }
}
