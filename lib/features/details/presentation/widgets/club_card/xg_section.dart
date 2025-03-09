import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/custom_show_row.dart';
import 'package:evoluton_x/features/details/presentation/widgets/club_card/custom_players_xg.dart';
import 'package:flutter/material.dart';

class XgSection extends StatelessWidget {
  const XgSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShowRow(
          text: AppStrings.xg,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        const XgListView(),
      ],
    );
  }
}

class XgListView extends StatelessWidget {
  const XgListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsetsDirectional.only(bottom: 10, end: 15),
        child: CustomPlayersXg(),
      ),
      itemCount: 4,
    );
  }
}
