// ignore_for_file: avoid_print

import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/otp_verification.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/resend_code_section.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/verify_pass_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPasswordViewBody extends StatelessWidget {
  const VerifyPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordBloc bloc = context.read<PasswordBloc>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const VerifyPassHeader(),
              const SizedBox(height: 80),
              Text(
                AppStrings.resetCodeSent,
                style: AppTextStyles.styleSemiBold16(context),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<PasswordBloc, PasswordState>(
                  builder: (context, state) {
                return OtpVerification(
                  controllers: bloc.controllers,
                  focusNodes: bloc.focusNodes,
                  onOtpFieldTapped: (index) {
                    bloc.add(OnOtpFieldTappedEvent(index: index));
                  },
                  onOtpFieldChanged: (index, value) {
                    bloc.add(OtpFieldChangedEvent(index: index, value: value));
                  },
                  hasError: bloc.hasError,
                );
              }),
              const SizedBox(
                height: 10,
              ),
              const ResendCodeSection(),
              const SizedBox(height: 60),
              AppButton(
                textButton: AppStrings.login,
                widthButton: double.infinity,
                onPressed: () {
                  if (bloc.enteredCode?.length == 6) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.resetPassword,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
