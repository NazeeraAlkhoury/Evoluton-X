import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_ayth_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_file_name_display.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_uploaded_status.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/login_proof_pending_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register/register_form.dart';
import 'package:flutter/material.dart';

class FileSelectedSection extends StatelessWidget {
  const FileSelectedSection({
    super.key,
    required this.selectedFileName,
  });

  final String? selectedFileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomFileNameDisplay(selectedFileName: selectedFileName),
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomUploadStatus(),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAuthButton(
              text: AppStrings.replace,
              onPressed: () {},
            ),
            AppButton(
              //  widthButton: 118,
              textButton: AppStrings.continu,
              onPressed: () {
                Navigator.of(context).pop();
                showRegisterBottomSheet(
                    context: context, widget: const LoginProofPendingSheet());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
