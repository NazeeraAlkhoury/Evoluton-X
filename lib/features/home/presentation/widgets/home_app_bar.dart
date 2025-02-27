import 'package:evoluton_x/core/utils/app_icons_assets.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          AppIconAssets.more,
        ),
      ),
      title: Image.asset(
        AppImageAssets.logo,
        width: 55,
        height: 44,
      ),
      actions: [
        AppButton(
          textButton: AppStrings.register,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.register);
          },
          hieghtButton: 36.77,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
