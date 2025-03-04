import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomClub extends StatelessWidget {
  const CustomClub({
    super.key,
  });
  // aspectRatio: 1.12 / 1.03,
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/club.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'nation',
                  style: AppTextStyles.styleRegular14(context).copyWith(
                    color: AppColors.offWhiteColor,
                  ),
                ),
                CircleAvatar(
                  radius: 10,
                  child: Image.asset(
                    'assets/images/flag.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Text(
              'club name',
              style: AppTextStyles.styleSemiBold16(context).copyWith(
                color: AppColors.offWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
