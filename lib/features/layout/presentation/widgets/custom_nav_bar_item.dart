import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final void Function() onPressed;

  const CustomNavBarItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.2 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: IconButton(
        icon: SvgPicture.asset(
          icon,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
