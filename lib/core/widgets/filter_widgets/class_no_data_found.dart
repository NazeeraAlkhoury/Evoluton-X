import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNoDataFound extends StatelessWidget {
  final String errMessg;
  const CustomNoDataFound({
    super.key,
    required this.errMessg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lotties/no_result.json',
            height: 200,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            errMessg,
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.deepSkyBlueColor.withOpacity(.8)),
          ),
        ],
      ),
    );
  }
}
