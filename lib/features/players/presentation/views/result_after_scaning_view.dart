import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/players/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_age_and_nation.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_prediction_result_item.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/custom_result_row.dart';
import 'package:evoluton_x/features/players/presentation/widgets/scanning/scanning_appbar.dart';
import 'package:flutter/material.dart';

class ResultAfterScaningView extends StatelessWidget {
  final PredictionResult result;
  const ResultAfterScaningView({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    List<ResultModel> items = [
      ResultModel(
          icon: Icons.sports_soccer,
          title: AppStrings.postion,
          value: result.data.positions),
      ResultModel(
          icon: Icons.star,
          title: AppStrings.rating,
          value: result.data.overallRating.toString()),
      ResultModel(
          icon: Icons.fitness_center,
          title: AppStrings.power,
          value: result.data.power.toString()),
      ResultModel(
          icon: Icons.euro,
          title: AppStrings.value,
          value: result.data.valueEuro.toString()),
      ResultModel(
          icon: Icons.money,
          title: AppStrings.salary,
          value: result.data.salaryEuro.toString()),
      ResultModel(
          icon: Icons.directions_walk,
          title: AppStrings.favLeg,
          value: result.data.preferredFoot),
      ResultModel(
          icon: Icons.trending_up,
          title: AppStrings.predictionResult,
          value: result.data.predictionResult.toString()),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ScaningAppBar(),
      body: SingleChildScrollView(
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
          CustomPredictionResultItem(items: items),
        ]),
      ),
    );
  }
}





            // const SizedBox(height: 25),

            // // زر التفاعل
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.add),
            //   label: const Text('ADD TO SQUAD'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blueAccent,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            //     textStyle: const TextStyle(fontSize: 18),
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            //   ),
            // ),
        

