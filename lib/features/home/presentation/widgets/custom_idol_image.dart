import 'package:flutter/material.dart';

class CustomIdolImage extends StatelessWidget {
  const CustomIdolImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/idiol_image.png',
            ),
          ),
        ),
      ),
    );
  }
}
