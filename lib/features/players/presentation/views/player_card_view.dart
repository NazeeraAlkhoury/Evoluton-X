// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api
import 'package:evoluton_x/features/players/domain/entities/player.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_event.dart';
import 'package:evoluton_x/features/players/presentation/widgets/player_card/player_card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerCardView extends StatefulWidget {
  final Player player;

  const PlayerCardView({super.key, required this.player});
  @override
  _PlayerCardView createState() => _PlayerCardView();
}

class _PlayerCardView extends State<PlayerCardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    final bloc = context.read<PlayerBloc>();
    bloc.add(GetPlayerDetailsEvent(playerId: widget.player.id));
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      if (_tabController.index == 0) {
        bloc.add(GetPlayerDetailsEvent(playerId: widget.player.id));
      } else if (_tabController.index == 1) {
        bloc.add(GetPlayerStatisticsEvent(playerId: widget.player.id));
      }
    });
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
      body: SafeArea(
        child: PlayerCardViewBody(
          tabController: _tabController,
          player: widget.player,
        ),
      ),
    );
  }
}
