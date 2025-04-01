import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/core/services/bloc_observer.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_themes.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(
      // DevicePreview(
      //   builder: (context) => MultiBlocProvider(providers: [
      //         BlocProvider(
      //           create: (context) => getIt<ClubFilterBloc>(),
      //         ),
      //         BlocProvider(
      //           create: (context) => getIt<SearchBloc>(),
      //         ),
      //       ], child: const MyApp())));

      MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => getIt<RegisterBloc>()
        ..add(
          LoginEvent(),
        ),
    ),
    BlocProvider(
      create: (context) => getIt<ClubFilterBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<SearchBloc>(),
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
      //  home: VerifyPasswordView(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
