import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_filter_dialog_action_button.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_selectable_tile.dart';
import 'package:flutter/material.dart';

Future<dynamic> showCustomFilterDialog(
  BuildContext context, {
  required String dialogTiltle,
  required List<String> options,
  required Function(String?) onSelected,
  required String? selectedOption,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          dialogTiltle,
          style: AppTextStyles.styleSemiBold16(context),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (option) => CustomSelectableTile(
                  title: option,
                  selectedOption: selectedOption,
                  onSelect: onSelected,
                ),
              )
              .toList(),
        ),
        actions: const [
          CustomFilterDialogActionButton(),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    },
  );
}
