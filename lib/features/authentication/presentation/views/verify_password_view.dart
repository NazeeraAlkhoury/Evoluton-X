import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/verify_password/verify_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPasswordView extends StatelessWidget {
  const VerifyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PasswordBloc>(),
      child: const Scaffold(
        body: VerifyPasswordViewBody(),
      ),
    );
  }
}
