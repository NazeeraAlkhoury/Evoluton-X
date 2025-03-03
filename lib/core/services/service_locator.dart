import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/bloc/layout_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    // Dio instance
    // getIt.registerLazySingleton<Dio>(
    //   () => Dio(),
    // );

    // //Api Service
    // getIt.registerLazySingleton<ApiService>(
    //   () => ApiService(dio: getIt()),
    // );

    //Bloc
    getIt.registerFactory<LayoutBloc>(
      () => LayoutBloc(),
    );
  }
}
