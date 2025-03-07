import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/search/presentation/widgets/custom_search_button.dart';
import 'package:evoluton_x/features/search/presentation/widgets/last_search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.searchNow,
            style: AppTextStyles.styleSemiBold18(context).copyWith(
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSearchButton(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.lastSearch,
                style: AppTextStyles.styleSemiBold18(context).copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                AppStrings.showAll,
                style: AppTextStyles.styleRegular14(context),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const LastSearchListView(),
        ],
      ),
    );
  }
}
