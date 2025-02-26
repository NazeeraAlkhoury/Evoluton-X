import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/home/presentation/widgets/idol_image_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Image.asset(
              AppImageAssets.homeImage,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text(
              AppStrings.aboutEvalationx,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 28,
              end: 20,
              top: 8,
              bottom: 8,
            ),
            child: Text(
              AppStrings.evolutionXTool,
              style: AppTextStyles.styleRegular14(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text(
              AppStrings.getProactiveInsights,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 28, end: 20, top: 8, bottom: 8),
            child: Text(
              AppStrings.predictPlayerDevelopment,
              style: AppTextStyles.styleSemiBold16(context),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 20, top: 8, bottom: 5),
            child: IdolImageListView(),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text(
              AppStrings.tryItNow,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 28, end: 20, top: 8, bottom: 8),
            child: Text(
              AppStrings.hurryLoginExperience,
              style: AppTextStyles.styleRegular14(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: AppButton(
              textButton: AppStrings.registerNow,
              onPressed: () {},
              widthButton: double.infinity,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
