import 'package:evoluton_x/features/clubs/domain/entities/club.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_club.dart';
import 'package:flutter/material.dart';

class ResultClubFilterGrid extends StatelessWidget {
  final List<Club> club;
  const ResultClubFilterGrid({
    super.key,
    required this.club,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: club.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) => CustomClub(
        club: club[index],
      ),
    );
  }
}
