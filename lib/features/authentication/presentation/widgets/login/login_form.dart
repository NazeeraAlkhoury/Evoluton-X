import 'package:evoluton_x/core/functions/show_custom_err_snack_bar.dart';
import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/functions/validate_input.dart';
import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login/custom_forger_pass_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final bloc = context.read<LoginBloc>();
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.email,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: bloc.emailController,
            hintText: AppStrings.enterEmail,
            prefixIcon: AppIconAssets.user,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateInput(val: value!, type: 'email'),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.password,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.darkGreyColor),
          ),
          const SizedBox(height: 8),
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
                previous.isObscurePass != current.isObscurePass,
            builder: (context, state) {
              return CustomTextFormField(
                controller: bloc.passwordController,
                hintText: AppStrings.yourPassword,
                prefixIcon: AppIconAssets.key,
                keyboardType: TextInputType.visiblePassword,
                isObscureText: state.isObscurePass,
                suffixIcon: state.isObscurePass
                    ? AppIconAssets.visibilityOff
                    : AppIconAssets.visibility,
                onSuffix: () => bloc.add(TogglePasswordVisibilityEvent()),
                validator: (value) => validateInput(
                    val: value!, min: 8, max: 25, type: 'password'),
                textInputAction: TextInputAction.done,
              );
            },
          ),
          const CustomForgetPassButton(),
          const SizedBox(height: 60),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loginState == RequestStates.failureState) {
                showCustomErrSnackBar(
                  context: context,
                  errMessage: state.loginErrMessage,
                );
                bloc.add(ResetLoginStateEvent());
              }
              if (state.loginState == RequestStates.successState) {
                _handleLoginSuccess(state, context);
              }
            },
            buildWhen: (previous, current) =>
                previous.loginState != current.loginState,
            builder: (context, state) {
              if (state.loginState == RequestStates.loadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return AppButton(
                  textButton: AppStrings.login,
                  widthButton: double.infinity,
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      bloc.add(UserLoginEvent());
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _handleLoginSuccess(LoginState state, BuildContext context) {
    getIt<CachServices>().saveData(
      key: AppConstants.token,
      value: state.loginAuthResponse!.data,
    );
    showCustomSuccessSnackBar(
        context: context, successMessage: state.loginAuthResponse!.message);

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.homeAfterChecked,
    );
  }
}
