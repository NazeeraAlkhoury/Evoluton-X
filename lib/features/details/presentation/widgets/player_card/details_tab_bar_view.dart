import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/features/details/presentation/widgets/player_card/custom_player_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsTapBarView extends StatelessWidget {
  const DetailsTapBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        height: 200,
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.darkGreyColor,
            width: 1,
          ),
        ),
        child: GridView.builder(
          itemCount: 6,
          itemBuilder: (context, index) =>
              const SizedBox(height: 36, child: CustomPlayerDetailsItem()),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 0,
          ),
        ),
        // child: SingleChildScrollView(
        //   child: const Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Expanded(child: CustomPlayerDetailsItem()),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(child: CustomPlayerDetailsItem()),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(child: CustomPlayerDetailsItem()),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Expanded(child: CustomPlayerDetailsItem()),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(child: CustomPlayerDetailsItem()),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(child: CustomPlayerDetailsItem()),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
