import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_image_assets.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_leading_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            leadingWidth: 140,
            leading: const CustomLeadingAppbar(),
            title: Image.asset(
              AppImageAssets.logo,
              width: 55,
              height: 44,
            ),
            centerTitle: true,
          ),
          const SliverToBoxAdapter(
            child: DetailsViewBody(),
          )
        ],
      ),
    );
  }
}
