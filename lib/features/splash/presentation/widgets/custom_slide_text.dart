import 'package:evoluton_x/features/splash/presentation/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomSlideText extends StatelessWidget {
  const CustomSlideText({
    super.key,
    required this.positionAnimation,
  });

  final Animation<Offset> positionAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: positionAnimation,
      child: GradientText(
        text: AppStrings.evolutonX,
        style: AppTextStyles.styleExtraBold26(context),
        gradient: const LinearGradient(
          colors: [
            Color(0xffA9EAF0),
            Color(0xff6D9595),
          ],
          //  stops: [0.7, 3.0],
        ),
      ),
    );
  }
}
