import 'package:evoluton_x/features/authentication/presentation/widgets/login/login_form.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login/login_header.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginHeader(),
              SizedBox(height: 60),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
