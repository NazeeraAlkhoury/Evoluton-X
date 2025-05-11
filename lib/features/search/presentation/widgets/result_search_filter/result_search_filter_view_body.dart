import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/appbar/custom_appbar.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/class_no_data_found.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';

import 'package:evoluton_x/features/search/presentation/widgets/result_search_filter/result_search_filter_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 70,
            ),
            sliver:
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              return RequestStateHandleWidget(
                  requestState: state.searchState,
                  errorMessage: state.searchErrMessage,
                  errorWidget: (context) => CustomNoDataFound(
                        errMessg: state.searchErrMessage,
                      ),
                  successWidget: (context) => ResultSearchFilterGridView(
                        player: state.players!.data,
                      ));
            })),
      ],
    );
  }
}
