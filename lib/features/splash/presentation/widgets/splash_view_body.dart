// ignore_for_file: avoid_print

import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/features/splash/presentation/widgets/custom_slide_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> positionAnimation;
  final CachServices cachServices = getIt<CachServices>();

  @override
  void initState() {
    super.initState();
    initAnimation();
    goToPage();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: getBoxDecoration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImageAssets.logo,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomSlideText(positionAnimation: positionAnimation),
          ],
        ),
      ),
    );
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.deepSkyBlueColor,
          AppColors.primaryColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    positionAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.forward();
  }

  Future<void> goToPage() async {
    final bool hasSeenOnBoarding =
        cachServices.getData(key: AppConstants.onBoardingSeen) ?? false;

    String? tokenSaved = cachServices.getData(key: AppConstants.token);

    return Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (hasSeenOnBoarding) {
          print(tokenSaved);
          if (tokenSaved != null) {
            Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
