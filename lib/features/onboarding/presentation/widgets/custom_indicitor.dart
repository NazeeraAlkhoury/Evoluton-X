import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_dot.dart';
import 'package:flutter/material.dart';

class CustomIndicitor extends StatelessWidget {
  final int currentPage;
  const CustomIndicitor({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: CustomDot(
            isActive: currentPage == index,
          ),
        ),
      ),
    );
  }
}
