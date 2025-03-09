import 'package:flutter/material.dart';

class CustomFlagOrClubAvatar extends StatelessWidget {
  final String imagePath;
  final double? radius;

  const CustomFlagOrClubAvatar(
      {super.key, required this.imagePath, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 8,
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
