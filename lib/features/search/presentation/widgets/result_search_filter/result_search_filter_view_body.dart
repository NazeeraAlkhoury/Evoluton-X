import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_appbar.dart';

import 'package:evoluton_x/features/search/presentation/widgets/result_search_filter/result_search_filter_grid_view.dart';
import 'package:flutter/material.dart';

class ResultSearchFilterViewBody extends StatelessWidget {
  const ResultSearchFilterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              AppStrings.theResult,
              style: AppTextStyles.styleSemiBold18(context).copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 70,
          ),
          sliver: ResultSearchFilterGridView(),
        )
      ],
    );
  }
}
