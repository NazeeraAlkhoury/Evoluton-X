import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_details_usecase.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_event.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetDetailsUsecase getDetailsUsecase;

  DetailsBloc({required this.getDetailsUsecase}) : super(const DetailsState()) {
    on<CarouselItemSelectedEvent>(_getCarouselItemSelectedEvent);
    on<GetDetailsEvent>(
      (event, emit) async {
        final result = await getDetailsUsecase(const NoParameters());
        result.fold(
          (failure) => emit(
            state.copyWith(
                getDetailsState: RequestStates.failureState,
                getDetailsErrMessage: failure.errorMessage),
          ),
          (details) => emit(
            state.copyWith(
              getDetailsState: RequestStates.successState,
              getDetailsResponse: details,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _getCarouselItemSelectedEvent(event, emit) {
    emit(
      state.copyWith(
          index: event.newIndex, changeSliderState: RequestStates.successState),
    );
  }
}
