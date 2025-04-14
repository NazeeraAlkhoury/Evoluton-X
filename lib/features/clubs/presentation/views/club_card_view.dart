import 'package:evoluton_x/features/clubs/domain/entities/club.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_event.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/club_card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubCardView extends StatefulWidget {
  final Club club;
  const ClubCardView({super.key, required this.club});

  @override
  State<ClubCardView> createState() => _ClubCardViewState();
}

class _ClubCardViewState extends State<ClubCardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    context.read<ClubBloc>().add(GetClubCardEvent(clubId: widget.club.id));
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
