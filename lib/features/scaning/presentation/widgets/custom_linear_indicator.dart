import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 20,
      barRadius: const Radius.circular(16),
      backgroundColor: AppColors.dotColor,
      linearGradient: const LinearGradient(
        colors: [Color(0xFF6D9594), Color(0xFFAAEBF1)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      percent: 0.5,
    );
  }
}
