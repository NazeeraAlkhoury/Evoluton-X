import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomUploadStatus extends StatelessWidget {
  const CustomUploadStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.uploaded,
          style: AppTextStyles.styleSemiBold16(context).copyWith(
            color: AppColors.greenColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(AppIconAssets.check),
      ],
    );
  }
}
