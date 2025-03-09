import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_show_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_goal_states.dart';
import 'package:flutter/material.dart';

class GoalsSection extends StatelessWidget {
  const GoalsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShowRow(
          text: AppStrings.goals,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        const GoalsListView(),
      ],
    );
  }
}

class GoalsListView extends StatelessWidget {
  const GoalsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CustomGoalsStates(),
      ),
      itemCount: 4,
    );
  }
}
