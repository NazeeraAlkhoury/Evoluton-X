import 'package:evoluton_x/features/details/presentation/widgets/custom_club.dart';
import 'package:flutter/material.dart';

class BestClubsListView extends StatelessWidget {
  const BestClubsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => const CustomClub(),
      ),
    );
  }
}
