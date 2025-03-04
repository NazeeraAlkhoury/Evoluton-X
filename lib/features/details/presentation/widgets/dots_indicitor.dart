import 'package:evoluton_x/features/details/presentation/widgets/custom_dot.dart';
import 'package:flutter/material.dart';

class DotsIndicitor extends StatelessWidget {
  const DotsIndicitor({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 5),
          child: CustomDots(
            isActive: _currentIndex == index,
          ),
        ),
      ),
    );
  }
}
