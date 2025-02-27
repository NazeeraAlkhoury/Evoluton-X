import 'package:evoluton_x/features/authentication/presentation/widgets/forget_password/forget_pass_form.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/forget_password/forget_pass_header.dart';
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
