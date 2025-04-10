import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:flutter/material.dart';

class RequestStateHandleWidget extends StatelessWidget {
  final RequestStates requestState;
  final String errorMessage;
  final WidgetBuilder successWidget;
  final WidgetBuilder? errorWidget;

  const RequestStateHandleWidget(
      {super.key,
      required this.requestState,
      required this.errorMessage,
      required this.successWidget,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    switch (requestState) {
      case RequestStates.failureState:
        if (errorWidget != null) {
          return errorWidget!(context);
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColors.blackColor,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: AppTextStyles.styleSemiBold16(context),
                  ),
                ),
              ],
            ),
          );
        }

      case RequestStates.loadingState:
        return const SizedBox(
          height: 155.8,
          child: Center(child: CircularProgressIndicator()),
        );
      case RequestStates.successState:
        return successWidget(context);

      default:
        return const SizedBox();
    }
  }
}
