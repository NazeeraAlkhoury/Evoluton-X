import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/bottomsheet_handle.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/logout/logout_action_section.dart';
import 'package:flutter/material.dart';

class LogoutAccountSheet extends StatelessWidget {
  const LogoutAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHandle(),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppStrings.wantLogout,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular14(context),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(AppImageAssets.logout),
          const SizedBox(
            height: 30,
          ),
          const LogoutActionSection(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
