import 'package:evoluton_x/core/utils/app_colors.dart';

import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordRequirementItem extends StatelessWidget {
  final String requirment;
  const PasswordRequirementItem({
    super.key,
    required this.requirment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: AppColors.deepSkyBlueColor.withOpacity(.7),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            requirment,
            style: AppTextStyles.styleRegular12(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
