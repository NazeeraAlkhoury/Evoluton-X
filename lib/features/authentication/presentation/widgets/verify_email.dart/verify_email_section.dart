import 'package:evoluton_x/core/functions/show_custom_err_snack_bar.dart';
import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/verify_email_err_message.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/resend_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailActionSection extends StatelessWidget {
  const VerifyEmailActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
      listener: (context, state) {
        if (state.resendCodeState == RequestStates.successState) {
          showCustomSuccessSnackBar(
              context: context,
              successMessage: state.resendCodeauthResponse!.message);
        }
        if (state.resendCodeState == RequestStates.failureState) {
          showCustomErrSnackBar(
            context: context,
            errMessage: state.resendCodeErrMessage,
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.authResponse?.message ==
                'Please check the code again or request another one.')
              VerifyEmailErrMessage(
                errMessage: state.authResponse!.message,
              ),
            if (state.validateOTPState == RequestStates.failureState)
              VerifyEmailErrMessage(
                errMessage: state.errMessage,
              ),
            ResndCodeRow(
              onPressed: () =>
                  context.read<VerifyEmailBloc>().add(const ResendCodeEvent()),
            ),
            const SizedBox(height: 60),
            AppButton(
              textButton: AppStrings.verifyEmail,
              widthButton: double.infinity,
              onPressed: () {
                if (state.validateOTPState == RequestStates.successState) {}
              },
            ),
          ],
        );
      },
    );
  }
}
