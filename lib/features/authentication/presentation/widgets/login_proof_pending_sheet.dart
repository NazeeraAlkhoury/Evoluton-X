import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text_styles.dart';

class LoginProofPendingSheet extends StatelessWidget {
  const LoginProofPendingSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.loginPending,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleSemiBold18(context)
                .copyWith(color: AppColors.blackColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.documentReviewEmail,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular14(context),
          ),
          const SizedBox(
            height: 40,
          ),
          AppButton(
            textButton: AppStrings.returnHome,
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.home);
              context.read<RegisterBloc>().close();
            },
            widthButton: double.infinity,
          ),
        ],
      ),
    );
  }
}
