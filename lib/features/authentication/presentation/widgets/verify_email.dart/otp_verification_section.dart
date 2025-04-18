import 'package:evoluton_x/core/functions/show_register_bottom_sheet.dart';
import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login_proof_pending_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerificationSection extends StatelessWidget {
  const OtpVerificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
        listener: (context, state) {
      if (state.validateOTPState == RequestStates.successState &&
          state.authResponse?.message !=
              'Please check the code again or request another one.') {
        showRegisterBottomSheet(
            context: context, widget: const LoginProofPendingSheet());
        String fName = context.read<RegisterBloc>().firstNameController.text;
        String lName = context.read<RegisterBloc>().lastNameController.text;
        getIt<CachServices>()
            .saveData(key: AppConstants.name, value: '$fName $lName');
      }
    }, builder: (context, state) {
      VerifyEmailBloc bloc = context.read<VerifyEmailBloc>();
      return OtpVerification(
        controllers: bloc.controllers,
        focusNodes: bloc.focusNodes,
        onOtpFieldTapped: (index) {
          bloc.add(OnOtpFieldTappedEvent(index: index));
        },
        onOtpFieldChanged: (index, value) {
          bloc.add(OtpFieldChangedEvent(index: index, value: value));
        },
        hasError: bloc.hasError,
      );
    });
  }
}
