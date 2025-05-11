import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_button.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActionButton extends StatelessWidget {
  const SearchActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.searchState == RequestStates.successState ||
            state.searchState == RequestStates.failureState) {
          Navigator.pushReplacementNamed(context, AppRoutes.resultSearchFilter);
        }
      },
      builder: (context, state) {
        final bloc = context.read<SearchBloc>();
        bool enableFilter = state.savedName != null;
        if (state.searchState == RequestStates.loadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: CustomFilterButton(
              label: AppStrings.filterNow,
              color: AppColors.primaryColor,
              onPressed: enableFilter
                  ? () {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        bloc.add(SearchPlayersEvent(name: state.savedName!));
                      });
                    }
                  : null,
              isOpacity: enableFilter,
              width: 156,
            ),
          );
        }
      },
    );
  }
}
