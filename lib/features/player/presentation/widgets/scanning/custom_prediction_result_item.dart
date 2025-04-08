import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/features/player/presentation/widgets/scanning/custom_result_row.dart';
import 'package:flutter/material.dart';

class CustomPredictionResultItem extends StatelessWidget {
  const CustomPredictionResultItem({
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
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: AppColors.fillFieldColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomResultRow(
                  resultModel: e,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
