import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/scaning/presentation/views/result_after_scaning_view.dart';
import 'package:evoluton_x/features/scaning/presentation/widgets/custom_linear_indicator.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ScaningViewBody extends StatelessWidget {
  const ScaningViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.tryModel,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.tryModelDesciption,
              style: AppTextStyles.styleRegular14(context),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                AppImageAssets.scan,
                //    height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const CustomLinearIndicator(),
            const SizedBox(height: 30),
            AppButton(
              textButton: AppStrings.scanningNow,
              widthButton: double.infinity,
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ResultAfterScaningView(),
                );
              },
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
