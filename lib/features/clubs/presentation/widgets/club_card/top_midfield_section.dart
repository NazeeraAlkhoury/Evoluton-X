import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/custom_player_profile_row.dart';
import 'package:flutter/material.dart';

class TopMidfielderSection extends StatelessWidget {
  const TopMidfielderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.topMidfielder,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 20,
        ),
        const TopMidfielderListView(),
      ],
    );
  }
}

class TopMidfielderListView extends StatelessWidget {
  const TopMidfielderListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CustomPlayerProfileRow(),
      ),
      itemCount: 4,
    );
  }
}
