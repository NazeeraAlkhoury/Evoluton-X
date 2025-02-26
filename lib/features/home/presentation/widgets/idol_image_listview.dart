import 'package:evoluton_x/features/home/presentation/widgets/custom_idol_image.dart';
import 'package:flutter/material.dart';

class IdolImageListView extends StatelessWidget {
  const IdolImageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const CustomIdolImage(),
      ),
    );
  }
}
