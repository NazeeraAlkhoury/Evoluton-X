import 'package:evoluton_x/features/player/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/player/presentation/controllers/player_bloc/player_event.dart';
import 'package:evoluton_x/features/player/presentation/controllers/player_bloc/player_state.dart';
import 'package:evoluton_x/features/player/presentation/widgets/details/custom_players_carousel.dart';
import 'package:evoluton_x/features/player/presentation/widgets/details/dots_indicitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final bloc = context.read<PlayerBloc>();
        return Column(
          children: [
            CustomPlayersCarousel(
              onChanged: (index, reason) => bloc.add(
                CarouselItemSelectedEvent(newIndex: index),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DotsIndicitor(currentIndex: state.index),
          ],
        );
      },
    );
  }
}
