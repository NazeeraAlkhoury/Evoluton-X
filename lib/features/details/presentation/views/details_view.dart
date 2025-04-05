import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/details/presentation/widgets/custom_appbar.dart';
import 'package:evoluton_x/features/details/presentation/widgets/details/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomAppBar(),
              SliverToBoxAdapter(
                child: DetailsViewBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
