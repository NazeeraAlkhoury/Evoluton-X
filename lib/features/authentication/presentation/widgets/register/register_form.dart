import 'package:evoluton_x/core/functions/show_register_bottom_sheet.dart';
import 'package:evoluton_x/core/functions/validate_input.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/register_with_proof_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    final registerFormKey = GlobalKey<FormState>();
    return Form(
      key: registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.firstName,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: bloc.firstNameController,
            hintText: AppStrings.firstName,
            prefixIcon: AppIconAssets.user,
            keyboardType: TextInputType.name,
            validator: (value) => validateInput(val: value!, type: 'firstname'),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.lastName,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: bloc.lastNameController,
            hintText: AppStrings.lastName,
            prefixIcon: AppIconAssets.user,
            keyboardType: TextInputType.name,
            validator: (value) => validateInput(val: value!, type: 'lastname'),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.email,
            style: AppTextStyles.styleSemiBold18(context),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: bloc.emailController,
            hintText: AppStrings.email,
            prefixIcon: AppIconAssets.mail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateInput(val: value!, type: 'email'),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.password,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: bloc.passwordController,
                hintText: AppStrings.password,
                prefixIcon: AppIconAssets.key,
                keyboardType: TextInputType.visiblePassword,
                isObscureText: state.isObscurePass,
                suffixIcon: state.isObscurePass
                    ? AppIconAssets.visibilityOff
                    : AppIconAssets.visibility,
                onSuffix: () => bloc.add(
                  TogglePasswordVisibilityEvent(),
                ),
                validator: (String? value) => validateInput(
                    val: value!, min: 8, max: 25, type: 'password'),
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.repeatPassword,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: bloc.repeatPasswordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: AppStrings.repeatPassword,
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
          const SizedBox(height: 20),
          AppButton(
            textButton: AppStrings.next,
            widthButton: double.infinity,
            onPressed: () {
              if (registerFormKey.currentState!.validate()) {
                showRegisterBottomSheet(
                  context: context,
                  widget: const RegisterwithProofSheet(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
