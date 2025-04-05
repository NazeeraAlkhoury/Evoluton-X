import 'package:evoluton_x/core/functions/show_custom_err_snack_bar.dart';
import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/functions/validate_input.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassForm extends StatelessWidget {
  const ForgetPassForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    PasswordBloc bloc = context.read<PasswordBloc>();
    return Form(
      key: formKey,
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
          CustomTextFormField(
            controller: bloc.emailController,
            hintText: AppStrings.enterEmail,
            prefixIcon: AppIconAssets.mail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateInput(val: value!, type: 'email'),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 60),
          BlocConsumer<PasswordBloc, PasswordState>(
            listener: (context, state) =>
                _forgetPassStateHandle(state, context),
            buildWhen: (previous, current) =>
                previous.forgetPassState != current.forgetPassState,
            builder: (context, state) {
              if (state.forgetPassState == RequestStates.loadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return AppButton(
                  textButton: AppStrings.login,
                  widthButton: double.infinity,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(ForgetPasswordEvent());
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

  void _forgetPassStateHandle(PasswordState state, BuildContext context) {
    if (state.forgetPassState == RequestStates.failureState) {
      showCustomErrSnackBar(
          context: context, errMessage: state.forgetPassErrMessage);
    }
    if (state.forgetPassState == RequestStates.successState) {
      showCustomSuccessSnackBar(
        context: context,
        successMessage: state.forgetPAssAuthResponse!.message,
      );
      Navigator.pushReplacementNamed(context, AppRoutes.verifyPassword);
      context.read<PasswordBloc>().add(ResetPasswordValueEvent());
    }
  }
}
