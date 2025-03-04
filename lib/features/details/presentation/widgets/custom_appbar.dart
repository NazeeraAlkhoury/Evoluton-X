import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_leading_appbar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 140,
      leading: const CustomLeadingAppbar(),
      title: Image.asset(
        AppImageAssets.logo,
        width: 55,
        height: 44,
      ),
      centerTitle: true,
    );
  }
}
