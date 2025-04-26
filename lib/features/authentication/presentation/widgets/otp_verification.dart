import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(int) onOtpFieldTapped;
  final Function(int, String) onOtpFieldChanged;
  final List<bool> hasError;
  const OtpVerification({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onOtpFieldTapped,
    required this.onOtpFieldChanged,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.99,
      child: Row(
        children: List.generate(6, (index) {
          return Expanded(
            child: AspectRatio(
              aspectRatio: .5 / .7,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: index < 6 ? 6 : 0),
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  cursorColor: AppColors.blackColor,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold18(context).copyWith(
                    color: const Color(0xffC3C3C3),
                  ),
                  onTap: () => onOtpFieldTapped(index),
                  onChanged: (value) => onOtpFieldChanged(index, value),
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: AppColors.deepSkyBlueColor.withOpacity(.7),
                    border: getBorderDecoration(
                        color: hasError[index]
                            ? AppColors.redColor
                            : AppColors.blackColor),
                    enabledBorder: getBorderDecoration(
                        color: hasError[index]
                            ? AppColors.redColor
                            : AppColors.blackColor),
                    focusedBorder: getBorderDecoration(
                        color: hasError[index]
                            ? AppColors.redColor
                            : AppColors.blackColor),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  OutlineInputBorder getBorderDecoration({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
    );
  }
}
