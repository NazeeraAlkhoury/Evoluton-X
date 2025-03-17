import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
