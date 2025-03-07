import 'package:evoluton_x/features/search/presentation/widgets/custom_last_search_item.dart';
import 'package:flutter/material.dart';

class LastSearchListView extends StatelessWidget {
  const LastSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: CustomLastSearchItem(),
        );
      },
    );
  }
}
