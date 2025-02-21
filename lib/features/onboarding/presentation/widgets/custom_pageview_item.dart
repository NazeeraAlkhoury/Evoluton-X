import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_indicitor.dart';

import 'package:flutter/material.dart';

class CustomPageViewItem extends StatelessWidget {
  final OnboardingItemModel model;
  final int currentPage;
  const CustomPageViewItem({
    super.key,
    required this.currentPage,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(model.image),
        const SizedBox(
          height: 20,
        ),
        CustomIndicitor(
          currentPage: currentPage,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          model.title,
          style: AppTextStyles.styleBold22(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.discription,
          textAlign: TextAlign.center,
          style: AppTextStyles.styleMedium15(context),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class OnboardingItemModel {
  final String title;
  final String discription;
  final String image;

  OnboardingItemModel(
      {required this.title, required this.discription, required this.image});
}
