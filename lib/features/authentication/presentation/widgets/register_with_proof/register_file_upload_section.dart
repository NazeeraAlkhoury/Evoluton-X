import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/custom_err_message.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_state.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/file_picker_section.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/file_selected_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFileUploadSection extends StatelessWidget {
  const RegisterFileUploadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.registerState == RequestStates.successState) {
          Navigator.pushReplacementNamed(context, AppRoutes.verifyEmail);
        }
      },
      builder: (context, state) {
        RegisterBloc bloc = context.read<RegisterBloc>();
        if (state.registerState == RequestStates.failureState) {
          return CustomErrorMessage(
            errMessage: state.registerErrMessage,
          );
        } else if (state.registerState == RequestStates.loadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return state.selectedFileName == null
              ? FilePickerSection(
                  onPressed: () async => bloc.add(ChooseDocumentEvent()),
                )
              : FileSelectedSection(
                  key: ValueKey(state.selectedFileName),
                  selectedFileName: state.selectedFileName,
                  replaceDoc: () async => bloc.add(ChooseDocumentEvent()),
                  continu: () {
                    context.read<RegisterBloc>().add(
                          RegisterWithUploadFileEvent(
                              filePath: state.selectedFilePath!,
                              fileName: state.selectedFileName!),
                        );
                  },
                );
        }
      },
    );
  }
}
