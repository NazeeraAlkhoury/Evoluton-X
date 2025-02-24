import 'package:evoluton_x/features/authentication/presentation/widgets/reset_pass_header.dart';
import 'package:flutter/material.dart';

class ResetPassViewBody extends StatelessWidget {
  const ResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              ResetPassHeader(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
