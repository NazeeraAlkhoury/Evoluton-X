import 'package:evoluton_x/core/functions/show_custom_bottom_sheet.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/delete_account/delet_account_sheet.dart';
import 'package:evoluton_x/features/authentication/presentation/widgets/logout/logout_account_sheet.dart';
import 'package:flutter/material.dart';

class PopupOptionsButton extends StatelessWidget {
  const PopupOptionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        width: 21,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.14),
          color: const Color(0xffE0E0E0),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Transform.rotate(
            angle: -1.5708,
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 15,
            ),
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == AppStrings.logOut) {
          showCustomBottomSheet(context, child: const LogoutAccountSheet());
        } else if (value == AppStrings.deleteAccount) {
          showCustomBottomSheet(context, child: const DeletAccountSheet());
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: true,
          textStyle: AppTextStyles.styleSemiBold16(context),
          value: AppStrings.logOut,
          child: const Text(
            AppStrings.logOut,
          ),
        ),
        PopupMenuItem(
          value: AppStrings.deleteAccount,
          textStyle: AppTextStyles.styleSemiBold16(context),
          child: const Text(
            AppStrings.deleteAccount,
          ),
        ),
      ],
    );
  }
}
