import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_pageview.dart';

import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_pageview_item.dart';
import 'package:evoluton_x/features/onboarding/presentation/widgets/custom_skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();
  int currentPage = 0;
  List<OnboardingItemModel> onBoarding = [
    OnboardingItemModel(
      title: AppStrings.introTitle1,
      discription: AppStrings.introDescription1,
      image: AppImageAssets.onboarding1,
    ),
    OnboardingItemModel(
      title: AppStrings.introTitle2,
      discription: AppStrings.introDescription2,
      image: AppImageAssets.onboarding2,
    ),
    OnboardingItemModel(
      title: AppStrings.introTitle3,
      discription: AppStrings.introDescription3,
      image: AppImageAssets.onboarding3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 24),
            child: Column(
              children: [
                const CustomSkipButton(),
                CustomPageView(
                  pageController: pageController,
                  onBoarding: onBoarding,
                  currentPage: currentPage,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                ),
                AppButton(
                  textButton: AppStrings.next,
                  onPressed: () {
                    goToNextPage();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void goToNextPage() {
    if (currentPage < onBoarding.length - 1) {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeInOut,
      );
    }
  }
}
