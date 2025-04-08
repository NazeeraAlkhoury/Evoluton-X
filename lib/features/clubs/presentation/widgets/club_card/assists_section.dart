import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_show_row.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_goal_states.dart';
import 'package:flutter/material.dart';

class AssistsSection extends StatelessWidget {
  const AssistsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShowRow(
          text: AppStrings.assists,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        const AssistsListView(),
      ],
    );
  }
}

class AssistsListView extends StatelessWidget {
  const AssistsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsetsDirectional.only(bottom: 10, end: 15),
        child: CustomGoalsStates(),
      ),
      itemCount: 4,
    );
  }
}
