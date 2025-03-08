import 'package:evoluton_x/features/details/presentation/widgets/custom_club.dart';
import 'package:flutter/material.dart';

class ResultClubGridView extends StatelessWidget {
  const ResultClubGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) => const CustomClub(),
    );
  }
}
