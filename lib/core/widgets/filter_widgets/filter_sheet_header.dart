import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/bottomsheet_handle.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_evolution_search_description.dart';
import 'package:flutter/material.dart';

class FilterSheetHeader extends StatelessWidget {
  final String type;
  const FilterSheetHeader({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: BottomSheetHandle(),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          type,
          style: AppTextStyles.styleSemiBold18(context).copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomEvolutonSearchDescription(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
