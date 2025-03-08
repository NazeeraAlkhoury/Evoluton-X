import 'package:evoluton_x/features/search/presentation/widgets/result_search_filter/result_search_filter_view_body.dart';
import 'package:flutter/material.dart';

class ResultSearchFilterView extends StatelessWidget {
  const ResultSearchFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResultSearchFilterViewBody(),
      ),
    );
  }
}
