import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_club_listview.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_clubs_show_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/players_card_listview.dart';
import 'package:evoluton_x/features/details/presentation/widgets/slider_section.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SliderSection(),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(
            AppStrings.suggest,
            style: AppTextStyles.styleSemiBold18(context)
                .copyWith(color: AppColors.blackColor),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: PlayerCardsListView(),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: BestClubsShowRow(),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: BestClubsListView(),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
