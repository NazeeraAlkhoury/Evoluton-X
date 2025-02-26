import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFileNameDisplay extends StatelessWidget {
  final String? selectedFileName;
  const CustomFileNameDisplay({
    super.key,
    required this.selectedFileName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: selectedFileName,
      readOnly: true,
      enabled: false,
      textAlign: TextAlign.center,
      style: AppTextStyles.styleSemiBold16(context).copyWith(
        color: const Color(0xffADADAD),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
