import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/bottomsheet_handle.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/delete_account/delete_acc_action_section.dart';
import 'package:flutter/material.dart';

class DeletAccountSheet extends StatelessWidget {
  const DeletAccountSheet({super.key});

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
            AppStrings.wantDelete,
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
          const DeleteAccountActionsSection(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
