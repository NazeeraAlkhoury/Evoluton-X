import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_dialog_action_button.dart';
import 'package:flutter/material.dart';

class CustomFilterWithTextFieldDialog extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String text;
  final void Function()? send;
  const CustomFilterWithTextFieldDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.text,
    this.send,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      title: Text(
        title,
        style: AppTextStyles.styleSemiBold16(context),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: TextFormField(
          controller: controller,
          style: AppTextStyles.styleRegular14(context),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.styleRegular14(context)
                .copyWith(color: AppColors.texthintColor),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
      actions: [
        CustomFilterDialogActionButton(
          textButton: AppStrings.send,
          color: AppColors.primaryColor,
          textColor: text.trim().isNotEmpty
              ? AppColors.buttonTextColor
              : AppColors.offWhiteColor.withOpacity(.4),
          onPressed: text.trim().isNotEmpty ? send : null,
        ),
        CustomFilterDialogActionButton(
            textButton: AppStrings.cancel,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
