import 'package:evoluton_x/features/clubs/domain/entities/club.dart';
import 'package:evoluton_x/core/widgets/custom_club.dart';
import 'package:flutter/material.dart';

class ClubSuggestionsGrid extends StatelessWidget {
  final List<Club> club;
  const ClubSuggestionsGrid({
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
// class ClubSuggestionsGrid extends StatelessWidget {
//   final List<Club> club;
//   const ClubSuggestionsGrid({
//     super.key,
//     required this.club,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.builder(
//       itemCount: 10,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         // childAspectRatio: 1.1 / 1.03,
//         crossAxisCount: 2,
//         crossAxisSpacing: 15,
//         mainAxisSpacing: 6,
//       ),
//       itemBuilder: (context, index) => CustomClub(
//         club: club[index],
//       ),
//     );
//   }
// }
