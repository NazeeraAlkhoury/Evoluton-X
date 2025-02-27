import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/reset_password/password_requirment_item.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/reset_password/reset_pass_form.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/reset_password/reset_pass_header.dart';
import 'package:flutter/material.dart';

class ResetPassViewBody extends StatelessWidget {
  const ResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const ResetPassHeader(),
              const SizedBox(height: 80),
              Text(
                AppStrings.enterAndConfirmNewPassword,
                style: AppTextStyles.styleSemiBold16(context),
              ),
              const SizedBox(height: 10),
              const PasswordRequirementItem(
                requirment: AppStrings.minPassword6Chars,
              ),
              const SizedBox(height: 15),
              const PasswordRequirementItem(
                requirment: AppStrings.passwordRequirements,
              ),
              const SizedBox(height: 30),
              const ResetPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}
