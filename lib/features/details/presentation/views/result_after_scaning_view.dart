import 'package:evoluton_x/features/details/presentation/widgets/scanning/scanning_appbar.dart';
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
