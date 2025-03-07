import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDots extends StatelessWidget {
  final bool isActive;
  const CustomDots({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? null : AppColors.dotColor,
        gradient: isActive
            ? const LinearGradient(
                colors: [Color(0xff0066FF), Color(0xff9747FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 1.0],
              )
            : null,
      ),
    );
  }
}
