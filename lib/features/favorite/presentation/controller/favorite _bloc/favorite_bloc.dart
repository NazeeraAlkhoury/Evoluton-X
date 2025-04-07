import 'package:bloc/bloc.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_event.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<FavoriteEvent>((event, emit) {});
  }
}
