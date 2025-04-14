import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_state.dart';
import 'package:evoluton_x/features/clubs/presentation/widgets/club_card/team_power_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamPowerSection extends StatelessWidget {
  const TeamPowerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.teamPower,
          style: AppTextStyles.styleSemiBold18(context)
              .copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<ClubBloc, ClubState>(
          builder: (context, state) {
            return RequestStateHandleWidget(
              requestState: state.getClubCardState,
              errorMessage: state.getClubCardErrMessage,
              successWidget: (context) => TeamPowerList(
                players: state.clubCard!.data.teamPower,
              ),
            );
          },
        ),
      ],
    );
  }
}
