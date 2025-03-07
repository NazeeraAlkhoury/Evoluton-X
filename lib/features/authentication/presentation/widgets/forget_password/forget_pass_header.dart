import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/auth_header_row.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ForgetPassHeader extends StatelessWidget {
  const ForgetPassHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBackButton(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
        ),
        const SizedBox(
          height: 12,
        ),
        const AuthHeaderRow(
          title: AppStrings.forgetPass,
        ),
      ],
    );
  }
}
