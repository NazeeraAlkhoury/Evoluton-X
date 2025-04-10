import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_state.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/result_club_filter/result_club_filter_grid.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultClubFilterViewBody extends StatelessWidget {
  const ResultClubFilterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
          SliverPadding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 70,
              ),
              sliver: SliverToBoxAdapter(child:
                  BlocBuilder<ClubFilterBloc, ClubFilterState>(
                      builder: (context, state) {
                return RequestStateHandleWidget(
                  requestState: state.clubWithFilterState,
                  errorMessage: state.clubsWithFilterErrMessage,
                  successWidget: (context) => ResultClubFilterGrid(
                    club: state.clubs!.data,
                  ),
                );
              }))),
        ],
      ),
    );
  }
}
