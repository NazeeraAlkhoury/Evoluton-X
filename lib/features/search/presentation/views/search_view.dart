import 'package:evoluton_x/features/players/presentation/widgets/custom_appbar.dart';
import 'package:evoluton_x/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomAppBar(),
        SliverToBoxAdapter(
          child: SearchViewBody(),
        )
      ],
    );
  }
}
