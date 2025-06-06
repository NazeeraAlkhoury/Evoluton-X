import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_state.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterClubsActionButton extends StatelessWidget {
  const FilterClubsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubFilterBloc, ClubFilterState>(
      listener: (context, state) {
        if (state.clubWithFilterState == RequestStates.successState ||
            state.clubWithFilterState == RequestStates.failureState) {
          Navigator.pushReplacementNamed(context, AppRoutes.resultClubFilter);
        }
      },
      builder: (context, state) {
        final bloc = context.read<ClubFilterBloc>();
        bool enableFilter = state.savedComp != null || state.savedName != null;
        if (state.clubWithFilterState == RequestStates.loadingState) {
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
                        bloc.add(
                          ClubWithFilterEvent(
                            clubsFilterParams: ClubsFilterParams(
                                name: state.savedName, comp: state.savedComp),
                          ),
                        );
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
