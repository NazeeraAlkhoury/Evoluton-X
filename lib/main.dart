import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/core/services/bloc_observer.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_themes.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(),
    // ),
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<ClubFilterBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<SearchBloc>(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evoluton-X',
      theme: AppThemes.lightThemeData,
      debugShowCheckedModeBanner: false,
      //  home: const SplashView(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splash,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
