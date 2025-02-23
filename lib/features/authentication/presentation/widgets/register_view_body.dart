import 'package:evoluton_x/features/authentication/presentation/widgets/register_form.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_header.dart';

import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  RegisterHeader(),
                  SizedBox(height: 15),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
