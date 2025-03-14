import 'package:evoluton_x/core/functions/show_custom_filter_dialog.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_button.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_selectable_dialog.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_selector_row.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_sheet_header.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({
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
            type: AppStrings.searchFilter,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchBloc, SearchState>(
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
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return FilterSelectorRow(
                title: AppStrings.club,
                textButton: state.savedClub ?? AppStrings.chooseClub,
                onPressed: () {
                  return _selectClub(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return FilterSelectorRow(
                title: AppStrings.postion,
                textButton: state.savedPosition ?? AppStrings.choosePostion,
                onPressed: () {
                  return _selectPosition(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return FilterSelectorRow(
                title: AppStrings.age,
                textButton: state.savedAge ?? AppStrings.chooseAge,
                onPressed: () {
                  return _selectAge(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              bool enableFilter = state.savedClub != null &&
                  state.savedNation != null &&
                  state.savedPosition != null &&
                  state.savedAge != null;
              return Center(
                child: CustomFilterButton(
                  label: AppStrings.filterNow,
                  color: AppColors.primaryColor,
                  onPressed: enableFilter
                      ? () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, AppRoutes.resultSearchFilter);
                          // PersistentNavBarNavigator.pushNewScreen(context,
                          //     screen: const ResultSearchFilterView(),
                          //     withNavBar: true);
                        }
                      : null,
                  isOpacity: enableFilter,
                  width: 156,
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _selectAge(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchBloc ageBloc = context.read<SearchBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectAge,
              options: ageBloc.age,
              selectedOption: state.selectedAge,
              onSelectOption: (age) => ageBloc.add(
                    SelectedAgeEvent(selectedAge: age),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                ageBloc.add(
                  SavedAgeEvent(
                    savedAge: state.selectedAge,
                  ),
                );
              });
        },
      ),
    );
  }

  Future<dynamic> _selectPosition(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchBloc positionBloc = context.read<SearchBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectPosition,
              options: positionBloc.positions,
              selectedOption: state.selectedPosition,
              onSelectOption: (position) => positionBloc.add(
                    SelectedPositionEvent(selectedPosition: position),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                positionBloc.add(
                  SavedPositionEvent(
                    savedPosition: state.selectedPosition,
                  ),
                );
              });
        },
      ),
    );
  }

  Future<dynamic> _selectClub(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchBloc clubBloc = context.read<SearchBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectClub,
              options: clubBloc.clubs,
              selectedOption: state.selectedClub,
              onSelectOption: (club) => clubBloc.add(
                    SelectedClubEvent(selectedClub: club),
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
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchBloc nationBloc = context.read<SearchBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectNation,
              options: nationBloc.nations,
              selectedOption: state.selectedNation,
              onSelectOption: (nation) => nationBloc.add(
                    SelectedNationEvent(selectedNation: nation),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                nationBloc.add(
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
