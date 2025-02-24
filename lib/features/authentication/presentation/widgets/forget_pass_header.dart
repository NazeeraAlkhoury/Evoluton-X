import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/auth_header_row.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ForgetPassHeader extends StatelessWidget {
  const ForgetPassHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomBackButton(),
        SizedBox(
          height: 12,
        ),
        AuthHeaderRow(
          title: AppStrings.forgetPass,
        ),
      ],
    );
  }
}
