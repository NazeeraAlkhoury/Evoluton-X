import 'package:cached_network_image/cached_network_image.dart';
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
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,

          width: double.infinity,
          height: double.infinity,
          //  placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        // Image.asset(
        //   imagePath,
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        //   height: double.infinity,
        // ),
      ),
    );
  }
}
