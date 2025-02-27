import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCloseSheet extends StatelessWidget {
  const CustomCloseSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.cancel_outlined,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
