import 'package:evoluton_x/core/utils/app_strings.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/appbar/custom_appbar.dart';
import 'package:evoluton_x/core/widgets/filter_widgets/class_no_data_found.dart';
import 'package:evoluton_x/core/widgets/request_state_handle_widget.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_bloc.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_state.dart';
import 'package:evoluton_x/features/favorite/presentation/widgets/favorite_players_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                AppStrings.yourFavorites,
                style: AppTextStyles.styleSemiBold16(context),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 70,
            ),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  return RequestStateHandleWidget(
                    requestState: state.getFavState,
                    errorMessage: state.getFavoriteErrMsg,
                    errorWidget: (context) => CustomNoDataFound(
                      errMessg: state.getFavoriteErrMsg,
                    ),
                    successWidget: (context) => FavoritePlayersGridView(
                      player: state.getFavResponse!.data,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
