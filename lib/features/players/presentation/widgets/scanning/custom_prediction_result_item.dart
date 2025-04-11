import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_result_row.dart';
import 'package:flutter/material.dart';

class CustomPredictionResult extends StatelessWidget {
  const CustomPredictionResult({
    super.key,
    required this.items,
  });

  final List<ResultModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (e) => Card(
              color: e.color,
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomResultRow(
                  resultModel: e,
                  isResult: e.title == AppStrings.predictionResult,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
