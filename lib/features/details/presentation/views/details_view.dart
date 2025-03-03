import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_club_listview.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_clubs_show_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_players_carousel.dart';
import 'package:evoluton_x/features/details/presentation/widgets/dots_indicitor.dart';
import 'package:evoluton_x/features/details/presentation/widgets/players_card_listview.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomPlayersCarousel(),
        const SizedBox(
          height: 10,
        ),
        DotsIndicitor(currentIndex: _currentIndex),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.suggest,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 5,
        ),
        const PlayerCardsListView(),
        const BestClubsShowRow(),
        const BestClubsListView(),
      ],
    );
  }
}
