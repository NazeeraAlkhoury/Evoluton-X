import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_email.dart/verify_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyEmailBloc>(),
      child: const Scaffold(
        body: VerifyEmailViewBody(),
      ),
    );
  }
}
