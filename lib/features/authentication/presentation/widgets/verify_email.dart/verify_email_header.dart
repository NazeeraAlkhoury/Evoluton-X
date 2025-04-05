import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/auth_header_row.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class VerifyEmailHeader extends StatelessWidget {
  const VerifyEmailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBackButton(
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.register),
        ),
        const SizedBox(
          height: 12,
        ),
        const AuthHeaderRow(
          title: AppStrings.verifyEmail,
        ),
      ],
    );
  }
}
