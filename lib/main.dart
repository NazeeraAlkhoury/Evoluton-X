import 'package:evoluton_x/core/utils/app_themes.dart';
import 'package:evoluton_x/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evoluton-X',
      theme: AppThemes.lightThemeData,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingView(),
    );
  }
}
