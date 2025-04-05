import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_ayth_button.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_file_name_display.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/register_with_proof/custom_uploaded_status.dart';
import 'package:flutter/material.dart';

class FileSelectedSection extends StatelessWidget {
  const FileSelectedSection({
    super.key,
    required this.selectedFileName,
    this.replaceDoc,
    this.continu,
  });

  final String? selectedFileName;
  final void Function()? replaceDoc;
  final void Function()? continu;
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
              onPressed: replaceDoc,
            ),
            AppButton(
              textButton: AppStrings.continu,
              onPressed: continu,
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
