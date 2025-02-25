import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetHandle extends StatelessWidget {
  const CustomBottomSheetHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.blackColor,
      ),
    );
  }
}
