import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscurePass = true;
  bool isObscureRepPass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.firstName,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.firstName,
            prefixIcon: AppIconAssets.user,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.lastName,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.lastName,
            prefixIcon: AppIconAssets.user,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.email,
            style: AppTextStyles.styleSemiBold18(context),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(
            hintText: AppStrings.email,
            prefixIcon: AppIconAssets.mail,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.password,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: AppStrings.password,
            prefixIcon: AppIconAssets.key,
            isObscureText: isObscurePass,
            suffixIcon: isObscurePass
                ? AppIconAssets.visibilityOff
                : AppIconAssets.visibility,
            onSuffix: () => setState(() {
              isObscurePass = !isObscurePass;
            }),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.repeatPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: AppStrings.repeatPassword,
            prefixIcon: AppIconAssets.key,
            isObscureText: isObscureRepPass,
            suffixIcon: isObscureRepPass
                ? AppIconAssets.visibilityOff
                : AppIconAssets.visibility,
            onSuffix: () => setState(() {
              isObscureRepPass = !isObscureRepPass;
            }),
          ),
          const SizedBox(height: 20),
          AppButton(
            textButton: AppStrings.next,
            onPressed: () {
              showRegisterBottomSheet(
                context: context,
                widget: const RegisterwithProofSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<dynamic> showRegisterBottomSheet(
    {required BuildContext context, required Widget widget}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      isDismissible: false,
      enableDrag: false,
      barrierColor: Colors.black.withOpacity(0.7),
      shape: const LinearBorder(),
      backgroundColor: AppColors.whiteColor,
      builder: (context) {
        return widget;
      });
}
