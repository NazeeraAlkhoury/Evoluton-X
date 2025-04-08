import 'package:evoluton_x/features/player/presentation/widgets/scanning/scaning_view_body.dart';
import 'package:evoluton_x/features/player/presentation/widgets/scanning/scanning_appbar.dart';
import 'package:flutter/material.dart';

class ScaningView extends StatelessWidget {
  final int playerId;
  const ScaningView({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ScaningAppBar(),
      body: ScaningViewBody(
        playerId: playerId,
      ),
    );
  }
}
