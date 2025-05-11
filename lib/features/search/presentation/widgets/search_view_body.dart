import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_player_info_card.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:evoluton_x/features/search/presentation/widgets/custom_search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
            Text(
              'All Players :',
              style: AppTextStyles.styleSemiBold18(context).copyWith(
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              return RequestStateHandleWidget(
                  requestState: state.getPlayersState,
                  errorMessage: state.getPlayersErrMessage,
                  successWidget: (context) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.getPlayers!.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 6,
                        ),
                        itemBuilder: (context, index) => CustomPlayerInfoCard(
                          player: state.getPlayers!.data[index],
                        ),
                      ));
            })
          ],
        ),
      ),
    );
  }
}
