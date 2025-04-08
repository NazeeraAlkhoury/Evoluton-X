import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/club_card_view_body.dart';
import 'package:flutter/material.dart';

class ClubCardView extends StatefulWidget {
  const ClubCardView({super.key});

  @override
  State<ClubCardView> createState() => _ClubCardViewState();
}

class _ClubCardViewState extends State<ClubCardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClubCardViewBody(tabController: _tabController),
    );
  }
}
