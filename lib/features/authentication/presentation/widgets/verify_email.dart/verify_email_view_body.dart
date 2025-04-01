// ignore_for_file: avoid_print

import 'package:evoluton_x/core/functions/show_register_bottom_sheet.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login_proof_pending_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/verify_email_header.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/otp_verification.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/resend_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const VerifyEmailHeader(),
              const SizedBox(height: 80),
              Text(
                AppStrings.verifyEmaildis,
                style: AppTextStyles.styleSemiBold16(context),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<VerifyEmailBloc, VerifyEmailState>(
                  builder: (context, state) {
                VerifyEmailBloc bloc = context.read<VerifyEmailBloc>();
                return OtpVerification(
                  controllers: bloc.controllers,
                  focusNodes: bloc.focusNodes,
                  onOtpFieldTapped: (index) {
                    bloc.add(OnOtpFieldTappedEvent(index: index));
                  },
                  onOtpFieldChanged: (index, value) {
                    bloc.add(OtpFieldChangedEvent(index: index, value: value));
                    if (state.validateOTPState == RequestStates.successState) {
                      showRegisterBottomSheet(
                          context: context,
                          widget: const LoginProofPendingSheet());
                    }
                  },
                  hasError: bloc.hasError,
                );
              }),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<VerifyEmailBloc, VerifyEmailState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.authResponse?.message ==
                          'Please check the code again or request another one.')
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 4, left: 15),
                          child: Text(
                            state.authResponse!.message,
                            style:
                                AppTextStyles.styleRegular12(context).copyWith(
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      if (state.validateOTPState == RequestStates.failureState)
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 4, left: 15),
                          child: Text(
                            state.errMessage,
                            style:
                                AppTextStyles.styleRegular12(context).copyWith(
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      const ResndCodeRow(),
                      const SizedBox(height: 60),
                      AppButton(
                        textButton: AppStrings.verifyEmail,
                        widthButton: double.infinity,
                        onPressed: () {
                          if (state.validateOTPState ==
                              RequestStates.successState) {
                            // Navigator.pushReplacementNamed(
                            //   context,
                            //   AppRoutes.resetPassword,
                            // );
                            print('success ========================');
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
