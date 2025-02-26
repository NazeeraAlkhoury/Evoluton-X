import 'package:evoluton_x/features/home/presentation/widgets/home_app_bar.dart';
import 'package:evoluton_x/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: HomeViewBody(),
    );
  }
}
