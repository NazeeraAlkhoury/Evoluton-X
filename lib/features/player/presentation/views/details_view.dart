import 'package:evoluton_x/features/player/presentation/widgets/custom_appbar.dart';
import 'package:evoluton_x/features/player/presentation/widgets/details/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAppBar(),
            SliverToBoxAdapter(
              child: DetailsViewBody(),
            )
          ],
        ),
      ),
    );
  }
}
