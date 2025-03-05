import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSelectableTile extends StatelessWidget {
  final String title;
  final String? selectedOption;
  final ValueChanged<String?> onSelect;

  const CustomSelectableTile({
    required this.title,
    required this.selectedOption,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.styleSemiBold16(context),
      ),
      trailing: Radio<String>(
        value: title,
        groupValue: selectedOption,
        onChanged: onSelect,
      ),
    );
  }
}
