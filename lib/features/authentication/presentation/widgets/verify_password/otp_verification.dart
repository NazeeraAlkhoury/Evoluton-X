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
              //1 / .8,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: index < 6 ? 6 : 0),
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  cursorColor: AppColors.blackColor,
                  maxLength: 1,
                  //  keyboardType: TextInputType.number,
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
//  const OtpVerification({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     PasswordBloc bloc = context.read<PasswordBloc>();
//     return BlocBuilder<PasswordBloc, PasswordState>(
//       builder: (context, state) {
//         return SizedBox(
//           height: 55.99,
//           child: Row(
//             children: List.generate(4, (index) {
//               return Expanded(
//                 child: AspectRatio(
//                   aspectRatio: 1 / .8,
//                   child: Container(
//                     margin:
//                         EdgeInsetsDirectional.only(start: index < 4 ? 4 : 0),
//                     child: TextFormField(
//                       controller: bloc.controllers[index],
//                       focusNode: bloc.focusNodes[index],
//                       cursorColor: AppColors.blackColor,
//                       maxLength: 1,
//                       //  keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.styleSemiBold18(context).copyWith(
//                         color: const Color(0xffC3C3C3),
//                       ),
//                       onTap: () => bloc.add(
//                         OnOtpFieldTappedEvent(index: index),
//                       ),
//                       onChanged: (value) => bloc.add(
//                         OtpFieldChangedEvent(index: index, value: value),
//                       ),
//                       decoration: InputDecoration(
//                         counterText: "",
//                         filled: true,
//                         fillColor: AppColors.deepSkyBlueColor.withOpacity(.7),
//                         border: getBorderDecoration(
//                             color: bloc.hasError[index]
//                                 ? AppColors.redColor
//                                 : AppColors.blackColor),
//                         enabledBorder: getBorderDecoration(
//                             color: bloc.hasError[index]
//                                 ? AppColors.redColor
//                                 : AppColors.blackColor),
//                         focusedBorder: getBorderDecoration(
//                             color: bloc.hasError[index]
//                                 ? AppColors.redColor
//                                 : AppColors.blackColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         );
//       },
//     );
//   }

//   OutlineInputBorder getBorderDecoration({required Color color}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: color,
//         width: 1.5,
//       ),
//     );
//   }
// }
// void _onTap(int index) {
  //   _controllers[index].selection = TextSelection.fromPosition(
  //     TextPosition(offset: _controllers[index].text.length),
  //   );
  // }

  // void _onChanged(int index, String value) {
  //   if (value.isNotEmpty) {
  //     if (index < 3) {
  //       _focusNodes[index + 1].requestFocus();
  //     } else {
  //       _focusNodes[index].unfocus();
  //       _validateOTP();
  //     }
  //   } else if (index > 0) {
  //     _focusNodes[index - 1].requestFocus();
  //   }
  // }

  // void _validateOTP() {
  //   String enteredOTP =
  //       _controllers.map((controller) => controller.text).join();

  //   if (enteredOTP == widget.correctOTP) {
  //     widget.onVerified(enteredOTP);
  //     setState(() {
  //       _hasError.fillRange(0, 4, false);
  //     });
  //   } else {
  //     setState(() {
  //       _hasError.fillRange(0, 4, true);
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   for (var controller in _controllers) {
  //     controller.dispose();
  //   }
  //   for (var node in _focusNodes) {
  //     node.dispose();
  //   }
  //   super.dispose();
  // }

