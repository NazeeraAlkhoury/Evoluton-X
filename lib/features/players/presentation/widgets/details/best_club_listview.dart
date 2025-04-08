import 'package:evoluton_x/features/players/domain/entities/club.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_club.dart';
import 'package:flutter/material.dart';

class BestClubsListView extends StatelessWidget {
  final List<Club> bestClubs;
  const BestClubsListView({
    super.key,
    required this.bestClubs,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bestClubs.length,
        itemBuilder: (context, index) => CustomClub(
          club: bestClubs[index],
        ),
      ),
    );
  }
}
