import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class FilterSelectorRow extends StatelessWidget {
  final String title;
  final String textButton;
  final Function()? onPressed;
  const FilterSelectorRow({
    super.key,
    required this.title,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.styleSemiBold16(context),
        ),
        const SizedBox(
          height: 46,
          child: VerticalDivider(
            color: AppColors.blackColor,
            thickness: 1,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        AppButton(
          textButton: textButton,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
