import 'package:evoluton_x/core/functions/show_custom_err_snack_bar.dart';
import 'package:evoluton_x/core/functions/show_custom_success_snack_bar.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/resend_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendCodeSection extends StatelessWidget {
  const ResendCodeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PasswordBloc bloc = context.read<PasswordBloc>();
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state.forgetPassState == RequestStates.failureState) {
          showCustomErrSnackBar(
              context: context, errMessage: state.forgetPassErrMessage);
        }
        if (state.forgetPassState == RequestStates.successState) {
          showCustomSuccessSnackBar(
            context: context,
            successMessage: state.forgetPAssAuthResponse!.message,
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.forgetPassState != current.forgetPassState ||
          previous.resendCodeState != current.resendCodeState,
      builder: (context, state) {
        return ResndCodeRow(
          onPressed: () => bloc.add(ForgetPasswordEvent()),
        );
      },
    );
  }
}
