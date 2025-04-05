import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
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

class DeleteAccountActionsSection extends StatelessWidget {
  const DeleteAccountActionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            _handleDeleteAccSuccess(state, context);
          },
          builder: (context, state) {
            if (state.deleteAccountState == RequestStates.loadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return AppButton(
                  textButton: AppStrings.deleteAccount,
                  onPressed: () {
                    final token =
                        getIt<CachServices>().getData(key: AppConstants.token);
                    if (token != null) {
                      context.read<AuthBloc>().add(
                            DeletAccountEvent(token: token),
                          );
                    }
                  });
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
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  void _handleDeleteAccSuccess(AuthState state, BuildContext context) {
    if (state.deleteAccountState == RequestStates.successState) {
      Navigator.of(context).pop();
      getIt<CachServices>().removeData(key: AppConstants.token);
      getIt<CachServices>().removeData(key: AppConstants.name);
      showCustomSuccessSnackBar(
          context: context,
          successMessage: state.deleteAccountAuthResponse!.message);

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }
}
