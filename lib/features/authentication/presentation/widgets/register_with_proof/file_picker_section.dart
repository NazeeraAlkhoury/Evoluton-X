import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class FilePickerSection extends StatelessWidget {
  final void Function()? onPressed;
  const FilePickerSection({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          textButton: AppStrings.chooseFile,
          widthButton: double.infinity,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
