import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/core/services/bloc_observer.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_themes.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<ClubFilterBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<PasswordBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<AuthBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<PlayerBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<FavoriteBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<ClubBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<SearchBloc>()..add(const GetPlayersEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evoluton-X',
      theme: AppThemes.lightThemeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
