import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/widgets/error_route_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/forget_password_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/login_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/register_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/reset_password_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/verify_password_view.dart';
import 'package:evoluton_x/features/details/presentation/views/filter_clubs_view.dart';
import 'package:evoluton_x/features/home/presentation/views/home_after_checked_view.dart';
import 'package:evoluton_x/features/home/presentation/views/home_view.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/bloc/layout_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/views/main_layout_view.dart';
import 'package:evoluton_x/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:evoluton_x/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';
  static const String homeAfterChecked = '/homeAfterChecked';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String verifyPassword = '/verifyPassword';
  static const String mainLayout = '/mainLayout';
  // static const String filterClubs = '/filterClubs';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case homeAfterChecked:
        return MaterialPageRoute(builder: (_) => const HomeAfterCheckedView());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case verifyPassword:
        return MaterialPageRoute(builder: (_) => const VerifyPasswordView());
      case mainLayout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<LayoutBloc>(),
            child: const MainLayoutView(),
          ),
        );
      // case filterClubs:
      //   return MaterialPageRoute(builder: (_) => const FilterClubsView());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRouteView());
    }
  }
}
