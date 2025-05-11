import 'package:evoluton_x/core/functions/show_custom_filter_dialog.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/custom_filter_with_text_field_dialog.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_selector_row.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/filter_sheet_header.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_state.dart';
import 'package:evoluton_x/features/search/presentation/widgets/search_action_button.dart';
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
                title: AppStrings.name,
                textButton: state.savedName ?? AppStrings.enterPlayerName,
                onPressed: () {
                  _selectName(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          const SearchActionButton(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _selectName(BuildContext context) {
    return showCustomFilterDialog(
      context,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchBloc bloc = context.read<SearchBloc>();
          return CustomFilterWithTextFieldDialog(
              title: AppStrings.enterPlayerNameToSearch,
              hintText: AppStrings.enterPlayerName,
              text: state.playerName,
              controller: bloc.nameController,
              send: () {
                Navigator.of(context).pop();
                bloc.add(
                  SavedNameEvent(
                    savedName: state.playerName,
                  ),
                );
              });
        },
      ),
    );
  }
}
