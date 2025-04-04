import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_ayth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutActionSection extends StatelessWidget {
  const LogoutActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.logoutState == RequestStates.successState) {
              Navigator.of(context).pop();
              showCustomSuccessSnackBar(
                  context: context,
                  successMessage: state.logoutAuthResponse!.message);
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
          },
          builder: (context, state) {
            if (state.logoutState == RequestStates.loadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return AppButton(
                textButton: AppStrings.logOut,
                onPressed: () {
                  context.read<AuthBloc>().add(
                        const LogoutEvent(token: AppConstants.token),
                      );
                },
              );
            }
          },
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: CustomAuthButton(
            text: AppStrings.back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
