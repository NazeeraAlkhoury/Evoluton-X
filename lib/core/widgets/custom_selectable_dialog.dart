import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_filter_dialog_action_button.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_selectable_tile.dart';
import 'package:flutter/material.dart';

class CustomSelectableDialog extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedOption;
  final void Function(String?) onSelectOption;
  final void Function()? onSavedOption;
  const CustomSelectableDialog({
    super.key,
    required this.options,
    this.selectedOption,
    required this.onSelectOption,
    this.onSavedOption,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyles.styleSemiBold16(context),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: options
            .map(
              (option) => CustomSelectableTile(
                title: option,
                selectedOption: selectedOption,
                onSelect: onSelectOption,
              ),
            )
            .toList(),
      ),
      actions: [
        CustomFilterDialogActionButton(
          textButton: AppStrings.send,
          color: AppColors.primaryColor,
          textColor: selectedOption != null
              ? AppColors.buttonTextColor
              : AppColors.offWhiteColor.withOpacity(.4),
          onPressed: selectedOption != null ? onSavedOption : null,
        ),
        CustomFilterDialogActionButton(
            textButton: AppStrings.cancel,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
    );
  }
}
