import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
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
    getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(),
    );
    getIt.registerFactory<LoginBloc>(
      () => LoginBloc(),
    );
    getIt.registerFactory<PasswordBloc>(
      () => PasswordBloc(),
    );
    getIt.registerFactory<LayoutBloc>(
      () => LayoutBloc(),
    );
    getIt.registerFactory<DetailsBloc>(
      () => DetailsBloc(),
    );
    getIt.registerFactory<ClubFilterBloc>(
      () => ClubFilterBloc(),
    );
    getIt.registerFactory<SearchBloc>(
      () => SearchBloc(),
    );
  }
}
