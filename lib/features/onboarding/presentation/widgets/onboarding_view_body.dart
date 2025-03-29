// ignore_for_file: use_build_context_synchronously

import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
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
  final CachServices cachServices = getIt<CachServices>();
  final PageController pageController = PageController();
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
                CustomSkipButton(
                  onPressed: () async {
                    await _submit();
                  },
                ),
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
                  widthButton: double.infinity,
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
    } else {
      _submit();
    }
  }

  Future<void> _submit() async {
    await cachServices.saveData(key: AppConstants.onBoardingSeen, value: true);
    Navigator.popAndPushNamed(context, AppRoutes.home);
  }
}
