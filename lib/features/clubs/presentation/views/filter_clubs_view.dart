import 'package:evoluton_x/features/clubs/presentation/widgets/filter_clubs/filter_clubs_view_body.dart';
import 'package:flutter/material.dart';

class FilterClubsView extends StatelessWidget {
  const FilterClubsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FilterClubsViewBody()),
    );
  }
}
