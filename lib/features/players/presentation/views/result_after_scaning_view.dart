import 'package:evoluton_x/features/players/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/result_after_scan_view_body.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/scanning_appbar.dart';
import 'package:flutter/material.dart';

class ResultAfterScaningView extends StatelessWidget {
  final PredictionResult result;
  const ResultAfterScaningView({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ScaningAppBar(),
      body: ResultAfterScanningViewBody(result: result),
    );
  }
}







            // const SizedBox(height: 25),

            // // زر التفاعل
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.add),
            //   label: const Text('ADD TO SQUAD'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blueAccent,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            //     textStyle: const TextStyle(fontSize: 18),
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            //   ),
            // ),
        

