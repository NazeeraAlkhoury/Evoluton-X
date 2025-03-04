import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_event.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(const DetailsState()) {
    on<CarouselItemSelectedEvent>(_getCarouselItemSelectedEvent);
  }

  FutureOr<void> _getCarouselItemSelectedEvent(event, emit) {
    emit(
      state.copyWith(
          index: event.newIndex, changeSliderState: RequestStates.successState),
    );
  }
}
