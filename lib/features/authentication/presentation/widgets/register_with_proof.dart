import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class RegisterwithProofSheet extends StatelessWidget {
  const RegisterwithProofSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              child: const Icon(
                Icons.cancel_outlined,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppStrings.proofPractice,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleSemiBold18(context)
                .copyWith(color: AppColors.blackColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.uploadScoutProof,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular14(context),
          ),
          const SizedBox(
            height: 40,
          ),
          AppButton(
            textButton: AppStrings.chooseFile,
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
