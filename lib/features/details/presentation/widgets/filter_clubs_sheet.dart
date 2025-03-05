import 'package:evoluton_x/core/functions/show_custom_filter_dialog.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_filter_button.dart';
import 'package:evoluton_x/features/details/presentation/widgets/filter_selector_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/filter_sheet_header.dart';
import 'package:flutter/material.dart';

class FilterClubsSheet extends StatelessWidget {
  const FilterClubsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> nations = ["England", "Spain", "Italy", "Germany"];
    List<String> clubs = [
      "Barcelona",
      "Real Madrid",
      "Juventus",
      "Manchester United"
    ];
    String? selectedOption;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterSheetHeader(
          type: AppStrings.clubsFilter,
        ),
        FilterSelectorRow(
          title: AppStrings.nation,
          textButton: AppStrings.chooseNation,
          onPressed: () => showCustomFilterDialog(
            context,
            dialogTiltle: AppStrings.selectNation,
            options: nations,
            onSelected: (value) => selectedOption = value,
            selectedOption: selectedOption,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FilterSelectorRow(
          title: AppStrings.club,
          textButton: AppStrings.chooseClub,
          onPressed: () => showCustomFilterDialog(
            context,
            dialogTiltle: AppStrings.chooseClub,
            options: clubs,
            onSelected: (value) => selectedOption = value,
            selectedOption: selectedOption,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Center(
          child: CustomFilterButton(
            label: AppStrings.filterNow,
            color: AppColors.primaryColor,
            // onPressed: () {},
          ),
        ),
      ],
    );
  }
}
