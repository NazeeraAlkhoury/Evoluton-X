import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/custom_close_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/file_picker_section.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/file_selected_section.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RegisterwithProofSheet extends StatefulWidget {
  const RegisterwithProofSheet({
    super.key,
  });

  @override
  State<RegisterwithProofSheet> createState() => _RegisterwithProofSheetState();
}

class _RegisterwithProofSheetState extends State<RegisterwithProofSheet> {
  String? selectedFileName;

  Future chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          if (selectedFileName == null) ...[
            FilePickerSection(
              onPressed: chooseFile,
            ),
          ] else ...[
            FileSelectedSection(selectedFileName: selectedFileName),
          ],
        ],
      ),
    );
  }
}
