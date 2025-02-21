import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  final bool isActive;
  const CustomDot({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 8,
      width: isActive ? 36 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isActive ? AppColors.primaryColor : AppColors.dotColor,
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
