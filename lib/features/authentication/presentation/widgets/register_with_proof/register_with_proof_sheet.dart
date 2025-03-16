import 'package:evoluton_x/core/functions/show_register_bottom_sheet.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login_proof_pending_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_close_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/file_picker_section.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/file_selected_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterwithProofSheet extends StatelessWidget {
  const RegisterwithProofSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<RegisterBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomCloseSheet(),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppStrings.proofPractice,
              textAlign: TextAlign.center,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.uploadScoutProof,
              textAlign: TextAlign.center,
              style: AppTextStyles.styleRegular14(context),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                RegisterBloc bloc = context.read<RegisterBloc>();
                return state.selectedFileName == null
                    ? FilePickerSection(
                        onPressed: () async => bloc.add(ChooseDocumentEvent()),
                      )
                    : FileSelectedSection(
                        key: ValueKey(state.selectedFileName),
                        selectedFileName: state.selectedFileName,
                        replaceDoc: () async => bloc.add(ChooseDocumentEvent()),
                        continu: () {
                          Navigator.of(context).pop();
                          context.read<RegisterBloc>().close();
                          showRegisterBottomSheet(
                              context: context,
                              widget: const LoginProofPendingSheet());
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
