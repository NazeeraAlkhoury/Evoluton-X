import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLastSearchItem extends StatelessWidget {
  const CustomLastSearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          AppIconAssets.lastSearch,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            'Deutchland-Bundesliga-leipzig-(20-25YO)-defander',
            style: AppTextStyles.styleRegular14(context),
          ),
        ),
      ],
    );
  }
}
