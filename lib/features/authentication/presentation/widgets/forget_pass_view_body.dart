import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/auth_header_row.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_back_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/forget_pass_form.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/forget_pass_header.dart';
import 'package:flutter/material.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              ForgetPassHeader(),
              SizedBox(height: 80),
              ForgetPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}
