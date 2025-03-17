import 'package:evoluton_x/core/functions/show_custom_bottom_sheet.dart';
import 'package:evoluton_x/core/functions/validate_input.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/password_changed_success_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassForm extends StatelessWidget {
  const ResetPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordBloc bloc = context.read<PasswordBloc>();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.newPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          BlocBuilder<PasswordBloc, PasswordState>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: bloc.passwordController,
                hintText: AppStrings.enterNewPassword,
                prefixIcon: AppIconAssets.key,
                keyboardType: TextInputType.visiblePassword,
                isObscureText: state.isObscurePass,
                suffixIcon: state.isObscurePass
                    ? AppIconAssets.visibilityOff
                    : AppIconAssets.visibility,
                onSuffix: () => bloc.add(
                  TogglePasswordVisibilityEvent(),
                ),
                validator: (String? value) =>
                    validateInput(val: value!, min: 6, type: 'password'),
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.confirmPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          BlocBuilder<PasswordBloc, PasswordState>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: bloc.repeatPasswordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: AppStrings.confirmit,
                prefixIcon: AppIconAssets.key,
                isObscureText: state.isObscureRepPass,
                suffixIcon: state.isObscureRepPass
                    ? AppIconAssets.visibilityOff
                    : AppIconAssets.visibility,
                onSuffix: () => bloc.add(
                  ToggleRepeatPasswordVisibilityEvent(),
                ),
                validator: (String? value) => validateInput(
                  val: value!,
                  type: 'repeatPassword',
                  repeatPassword: bloc.passwordController.text ==
                      bloc.repeatPasswordController.text,
                ),
              );
            },
          ),
          const SizedBox(height: 60),
          AppButton(
              textButton: AppStrings.login,
              widthButton: double.infinity,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  showCustomBottomSheet(context,
                      child: const PasswordChangedSuccessSheet());
                }
              }),
        ],
      ),
    );
  }
}
