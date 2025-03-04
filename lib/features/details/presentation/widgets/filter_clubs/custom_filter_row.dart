import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_filter_button.dart';
import 'package:flutter/material.dart';

class CustomFilterRow extends StatelessWidget {
  const CustomFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.whoClubLookingFor,
          style: AppTextStyles.styleRegular14(context),
        ),
        const SizedBox(
          width: 25,
        ),
        const CustomFilterButton(),
      ],
    );
  }
}
