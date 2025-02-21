import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.onBoarding,
    required this.currentPage,
    this.onPageChanged,
  });

  final PageController pageController;
  final List<OnboardingItemModel> onBoarding;
  final int currentPage;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ExpandablePageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: onBoarding.length,
        itemBuilder: (context, index) => CustomPageViewItem(
          currentPage: currentPage,
          model: onBoarding[index],
        ),
      ),
    );
  }
}
