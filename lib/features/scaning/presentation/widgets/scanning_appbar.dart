import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ScaningAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScaningAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 16,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomBackButton(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
