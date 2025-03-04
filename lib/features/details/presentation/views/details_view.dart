import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_club_listview.dart';
import 'package:evoluton_x/features/details/presentation/widgets/best_clubs_show_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_leading_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/players_card_listview.dart';
import 'package:evoluton_x/features/details/presentation/widgets/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            leadingWidth: 140,
            leading: const CustomLeadingAppbar(),
            title: Image.asset(
              AppImageAssets.logo,
              width: 55,
              height: 44,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Column(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
