import 'package:evoluton_x/core/functions/format_currency.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/players/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_age_and_nation.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_prediction_result_item.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_result_row.dart';
import 'package:flutter/material.dart';

class ResultAfterScanningViewBody extends StatelessWidget {
  const ResultAfterScanningViewBody({
    super.key,
    required this.result,
  });

  final PredictionResult result;

  @override
  Widget build(BuildContext context) {
    List<ResultModel> items = [
      ResultModel(
          icon: Icons.sports_soccer,
          title: AppStrings.postion,
          value: result.data.positions,
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.star,
          title: AppStrings.rating,
          value: result.data.overallRating.toString(),
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.fitness_center,
          title: AppStrings.power,
          value: result.data.power.toString(),
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.euro,
          title: AppStrings.value,
          value: formatCurrency(result.data.valueEuro),
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.money,
          title: AppStrings.salary,
          value: formatCurrency(result.data.salaryEuro),
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.directions_walk,
          title: AppStrings.favLeg,
          value: result.data.preferredFoot,
          color: const Color(0xffe7feff)),
      ResultModel(
          icon: Icons.trending_up,
          title: AppStrings.predictionResult,
          value: result.data.predictionResult.toString(),
          color: AppColors.primaryColor),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        CustomFlagOrClubAvatar(
          imagePath: result.data.imageUrl[0],
          radius: 60,
        ),
        const SizedBox(height: 20),
        Text(
          result.data.name,
          style: AppTextStyles.styleBold22(context),
        ),
        const SizedBox(height: 12),
        CustomAgeandNation(
          imageUrl: result.data.nation,
          age: result.data.age,
        ),
        const SizedBox(height: 25),
        CustomPredictionResult(items: items),
      ]),
    );
  }
}
