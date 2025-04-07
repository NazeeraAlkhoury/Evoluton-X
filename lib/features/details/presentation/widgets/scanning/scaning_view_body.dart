import 'package:evoluton_x/core/functions/show_custom_err_snack_bar.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/app_button.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_state.dart';
import 'package:evoluton_x/features/details/presentation/widgets/scanning/custom_linear_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/details_bloc/details_event.dart';

class ScaningViewBody extends StatelessWidget {
  final int playerId;
  const ScaningViewBody({
    super.key,
    required this.playerId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.tryModel,
              style: AppTextStyles.styleSemiBold18(context)
                  .copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.tryModelDesciption,
              style: AppTextStyles.styleRegular14(context),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                AppImageAssets.scan,
                //    height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                return CustomLinearIndicator(
                  percent: state.progress!.clamp(0.0, 1.0),
                );
              },
            ),
            const SizedBox(height: 40),
            BlocConsumer<DetailsBloc, DetailsState>(
              listener: (context, state) {
                if (state.predictionResultState == RequestStates.failureState) {
                  showCustomErrSnackBar(
                    context: context,
                    errMessage: state.predictionResultErrMessage,
                  );
                }
              },
              buildWhen: (previous, current) =>
                  previous.predictionResultState !=
                  current.predictionResultState,
              builder: (context, state) {
                return AppButton(
                  textButton: _getButtonText(state.predictionResultState),
                  widthButton: double.infinity,
                  onPressed: (state.predictionResultState ==
                          RequestStates.failureState)
                      ? () {
                          context.read<DetailsBloc>().add(
                                GetPredictionResultEvent(playerId: playerId),
                              );
                        }
                      : (state.predictionResultState ==
                              RequestStates.successState)
                          ? () {
                              Navigator.pushNamed(
                                  context, AppRoutes.resultAfterScaning,
                                  arguments: state.predictionResult);
                            }
                          : null,
                );
              },
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  String _getButtonText(RequestStates state) {
    switch (state) {
      case RequestStates.loadingState:
        return AppStrings.scanningNow;
      case RequestStates.failureState:
        return "Try Again";
      case RequestStates.successState:
        return "View Result";
      case RequestStates.initialState:
      default:
        return "Start Scanning";
    }
  }
}
