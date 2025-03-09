import 'package:evoluton_x/features/scaning/presentation/widgets/scanning_appbar.dart';
import 'package:flutter/material.dart';

class ResultAfterScaningView extends StatelessWidget {
  const ResultAfterScaningView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ScaningAppBar(),
    );
  }
}
