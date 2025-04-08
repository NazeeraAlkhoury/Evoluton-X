import 'package:evoluton_x/core/functions/show_custom_filter_dialog.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_selectable_dialog.dart';
import 'package:evoluton_x/features/player/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/player/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/player/presentation/controllers/club_filter_bloc/club_filter_state.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_button.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_selector_row.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterClubsSheet extends StatelessWidget {
  const FilterClubsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterSheetHeader(
            type: AppStrings.clubsFilter,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ClubFilterBloc, ClubFilterState>(
            builder: (context, state) {
              return FilterSelectorRow(
                title: AppStrings.nation,
                textButton: state.savedNation ?? AppStrings.chooseNation,
                onPressed: () {
                  _selectNation(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ClubFilterBloc, ClubFilterState>(
              builder: (context, state) {
            return FilterSelectorRow(
              title: AppStrings.club,
              textButton: state.savedClub ?? AppStrings.chooseClub,
              onPressed: () {
                _selectClub(context);
              },
            );
          }),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<ClubFilterBloc, ClubFilterState>(
            builder: (context, state) {
              bool enableFilter =
                  state.savedClub != null && state.savedNation != null;
              return Center(
                child: CustomFilterButton(
                  label: AppStrings.filterNow,
                  color: AppColors.primaryColor,
                  onPressed: enableFilter
                      ? () {
                          //Navigator.pop(context);
                          // PersistentNavBarNavigator.pushNewScreen(
                          //   context,
                          //   screen: const ResultClubFilterView(),
                          //   withNavBar: true,
                          // );
                          // Navigator.pushReplacementNamed(
                          //     context, DetailsRoute.resultClubFilter);
                          Future.delayed(const Duration(milliseconds: 200), () {
                            return Navigator.pushReplacementNamed(
                                context, AppRoutes.resultClubFilter);
                          });
                        }
                      : null,
                  isOpacity: enableFilter,
                  width: 156,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _selectClub(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<ClubFilterBloc, ClubFilterState>(
        builder: (context, state) {
          ClubFilterBloc clubBloc = context.read<ClubFilterBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectClub,
              options: clubBloc.clubs,
              selectedOption: state.selectedClub,
              onSelectOption: (club) => clubBloc.add(
                    SelectedClubEvent(
                      selectedClub: club,
                    ),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                clubBloc.add(
                  SavedClubEvent(
                    savedClub: state.selectedClub,
                  ),
                );
              });
        },
      ),
    );
  }

  Future<dynamic> _selectNation(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<ClubFilterBloc, ClubFilterState>(
        builder: (context, state) {
          ClubFilterBloc bloc = context.read<ClubFilterBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectNation,
              options: bloc.nations,
              selectedOption: state.selectedNation,
              onSelectOption: (nation) => bloc.add(
                    SelectedNationEvent(
                      selectedNation: nation,
                    ),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                bloc.add(
                  SavedNationEvent(
                    savedNation: state.selectedNation,
                  ),
                );
              });
        },
      ),
    );
  }
}
