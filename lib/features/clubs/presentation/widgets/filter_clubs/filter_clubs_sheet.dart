import 'package:evoluton_x/core/functions/show_custom_filter_dialog.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_with_text_field_dialog.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_selectable_dialog.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_event.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_state.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_selector_row.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_sheet_header.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/filter_clubs/filter_clubs_action_button.dart';
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
                title: AppStrings.name,
                textButton: state.savedName ?? AppStrings.enterName,
                onPressed: () => _selectName(context),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ClubFilterBloc, ClubFilterState>(
              builder: (context, state) {
            return FilterSelectorRow(
              title: AppStrings.comp,
              textButton: state.savedComp ?? AppStrings.chooseComp,
              onPressed: () => _selectClub(context),
            );
          }),
          const SizedBox(
            height: 50,
          ),
          const FilterClubsActionButton(),
        ],
      ),
    );
  }

  Future<dynamic> _selectName(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<ClubFilterBloc, ClubFilterState>(
        builder: (context, state) {
          ClubFilterBloc bloc = context.read<ClubFilterBloc>();
          return CustomFilterWithTextFieldDialog(
              title: AppStrings.enterNameToSearch,
              hintText: AppStrings.enterName,
              text: state.clubName,
              controller: bloc.nameController,
              send: () {
                Navigator.of(context).pop();
                bloc.add(
                  SavedNameEvent(
                    savedName: state.clubName,
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
      child: BlocBuilder<ClubFilterBloc, ClubFilterState>(
        builder: (context, state) {
          ClubFilterBloc clubBloc = context.read<ClubFilterBloc>();
          return CustomSelectableDialog(
              title: AppStrings.selectClub,
              options: clubBloc.comps,
              selectedOption: state.selectedComp,
              onSelectOption: (club) => clubBloc.add(
                    SelectedCompEvent(
                      selectedComp: club,
                    ),
                  ),
              onSavedOption: () {
                Navigator.of(context).pop();
                clubBloc.add(
                  SavedCompEvent(
                    savedComp: state.selectedComp,
                  ),
                );
              });
        },
      ),
    );
  }
}
