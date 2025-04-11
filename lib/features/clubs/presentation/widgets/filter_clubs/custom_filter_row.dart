import 'package:evoluton_x/core/functions/show_custom_bottom_sheet.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_button.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/filter_clubs/filter_clubs_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        CustomFilterButton(
          label: AppStrings.clubsFilter,
          onPressed: () {
            context.read<ClubFilterBloc>().add(ResetFilterEvent());
            showCustomBottomSheet(
              context,
              child: const FilterClubsSheet(),
            );
          },
        ),
      ],
    );
  }
}
