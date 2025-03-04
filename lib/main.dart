import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/services/bloc_observer.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_routes.dart';
import 'package:evoluton_x/core/utils/app_themes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp(),
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
      // home: SplashView(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splash,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
