import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/otp_verification_section.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/verify_email_header.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/verify_email_section.dart';
import 'package:flutter/material.dart';

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
              const OtpVerificationSection(),
              const SizedBox(
                height: 10,
              ),
              const VerifyEmailActionSection(),
            ],
          ),
        ),
      ),
    );
  }
}
