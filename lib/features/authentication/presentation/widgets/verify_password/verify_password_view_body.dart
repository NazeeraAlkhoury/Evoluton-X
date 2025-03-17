// ignore_for_file: avoid_print

import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/otp_verification.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/resend_code_row.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/verify_pass_header.dart';
import 'package:flutter/material.dart';

class VerifyPasswordViewBody extends StatelessWidget {
  const VerifyPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              OtpVerification(
                onVerified: (String otp) {
                  print("The Coe is: $otp");
                },
                correctOTP: '1234',
              ),
              const SizedBox(
                height: 10,
              ),
              const ResndCodeRow(),
              const SizedBox(height: 60),
              AppButton(
                textButton: AppStrings.login,
                widthButton: double.infinity,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
