import 'package:evoluton_x/core/functions/show_custom_bottom_sheet.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/widgets/search_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          context.read<SearchBloc>().add(const ResetSearchEvent());
          showCustomBottomSheet(
            context,
            child: const SearchFilterSheet(),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: AppColors.dotColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: AppColors.darkGreyColor,
              ),
              Text(
                AppStrings.search,
                style: AppTextStyles.styleRegular14(context).copyWith(
                  color: AppColors.darkGreyColor,
                ),
              ),
              const Spacer(),
              Transform.rotate(
                angle: 1.5708,
                child: SvgPicture.asset(AppIconAssets.filter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
