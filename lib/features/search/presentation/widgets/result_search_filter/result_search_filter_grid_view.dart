import 'package:flutter/material.dart';

class ResultSearchFilterGridView extends StatelessWidget {
  const ResultSearchFilterGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: 1.1 / 1.03,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) => const SizedBox(),
      //const CustomPlayerInfoCard(),
    );
  }
}
