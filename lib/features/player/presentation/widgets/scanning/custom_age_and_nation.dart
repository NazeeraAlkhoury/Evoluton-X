import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';

import 'package:flutter/material.dart';

class CustomAgeandNation extends StatelessWidget {
  final num age;
  final String imageUrl;
  const CustomAgeandNation({
    super.key,
    required this.age,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(age.toString(), style: AppTextStyles.styleSemiBold16(context)),
        const SizedBox(width: 10),
        CustomFlagOrClubAvatar(
          imagePath: imageUrl,
          radius: 12,
        ),
      ],
    );
  }
}
