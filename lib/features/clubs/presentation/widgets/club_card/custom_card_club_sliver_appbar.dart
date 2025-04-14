import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:evoluton_x/core/widgets/custom_err_message.dart';
import 'package:evoluton_x/core/widgets/custom_flag_or_club_avatar.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardClubSleverAppBar extends StatelessWidget {
  const CustomCardClubSleverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubBloc, ClubState>(
      builder: (context, state) {
        if (state.getClubCardState == RequestStates.loadingState) {
          return const CustomSliverLoading();
        } else if (state.getClubCardState == RequestStates.successState) {
          return SliverAppBar(
            expandedHeight: 280,
            elevation: 0,
            floating: false,
            pinned: true,
            titleTextStyle: AppTextStyles.styleRegular16(context),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CustomBackButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFlagOrClubAvatar(
                    imagePath: state.clubCard?.data.imageUrl ?? '',
                    radius: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFlagOrClubAvatar(
                        imagePath: state.clubCard?.data.nation ?? '',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          state.clubCard?.data.nationName ?? '',
                          style: AppTextStyles.styleRegular14(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  state.clubCard?.data.name ?? '',
                  style: AppTextStyles.styleRegular16(context),
                ),
              ),
              centerTitle: true,
            ),
          );
        } else {
          return CustomSliverErr(
            errMessage: state.getClubCardErrMessage,
          );
        }
      },
    );
  }
}

class CustomSliverErr extends StatelessWidget {
  final String errMessage;
  const CustomSliverErr({
    super.key,
    required this.errMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: 280, child: CustomErrorMessage(errMessage: errMessage)),
    );
  }
}

class CustomSliverLoading extends StatelessWidget {
  const CustomSliverLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
