import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/widgets/error_route_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/forget_password_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/login_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/register_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/reset_password_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/verify_email_view.dart';
import 'package:evoluton_x/features/authentication/presentation/views/verify_password_view.dart';
import 'package:evoluton_x/features/details/domain/entities/player.dart';
import 'package:evoluton_x/features/details/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/details/presentation/views/club_card_view.dart';
import 'package:evoluton_x/features/details/presentation/views/details_view.dart';
import 'package:evoluton_x/features/details/presentation/views/filter_clubs_view.dart';
import 'package:evoluton_x/features/details/presentation/views/player_card_view.dart';
import 'package:evoluton_x/features/details/presentation/views/result_club_filter_view.dart';
import 'package:evoluton_x/features/favorite/presentation/views/favorite_view.dart';
import 'package:evoluton_x/features/home/presentation/views/home_after_checked_view.dart';
import 'package:evoluton_x/features/home/presentation/views/home_view.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/views/main_layout_view.dart';
import 'package:evoluton_x/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:evoluton_x/features/details/presentation/views/result_after_scaning_view.dart';
import 'package:evoluton_x/features/details/presentation/views/scaning_view.dart';
import 'package:evoluton_x/features/search/presentation/views/result_search_filter_view.dart';
import 'package:evoluton_x/features/search/presentation/views/search_view.dart';
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
  static const String details = '/details';
  static const String clubFilter = '/clubFilter';
  static const String resultClubFilter = '/resultClubFilter';
  static const String clubCard = '/clubCard';
  static const String playerCard = '/playerCard';
  static const String scaning = '/scaning';
  static const String resultSearchFilter = '/resultSearchFilter';
  static const String search = '/search';
  static const String resultAfterScaning = '/resultAfterScaning';
  static const String verifyEmail = '/verifyEmail';

  static const String favorite = '/favorite';

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
      case verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmailView());
      case mainLayout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<LayoutBloc>(),
            child: const MainLayoutView(),
          ),
        );

      case details:
        return MaterialPageRoute(builder: (_) => const DetailsView());
      case clubFilter:
        return MaterialPageRoute(builder: (_) => const FilterClubsView());
      case resultClubFilter:
        return MaterialPageRoute(builder: (_) => const ResultClubFilterView());
      case clubCard:
        return MaterialPageRoute(builder: (_) {
          return const ClubCardView();
        });
      case playerCard:
        return MaterialPageRoute(builder: (_) {
          final player = settings.arguments as Player;
          return PlayerCardView(
            player: player,
          );
        });
      case search:
        return MaterialPageRoute(builder: (_) => const SearchView());
      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteView());
      case scaning:
        return MaterialPageRoute(builder: (_) {
          final playerId = settings.arguments as int;
          return ScaningView(
            playerId: playerId,
          );
        });
      case resultAfterScaning:
        return MaterialPageRoute(builder: (_) {
          final result = settings.arguments as PredictionResult;
          return ResultAfterScaningView(
            result: result,
          );
        });
      case resultSearchFilter:
        return MaterialPageRoute(
            builder: (_) => const ResultSearchFilterView());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorRouteView());
    }
  }
}

// abstract class DetailsRoute {
//   static const String details = '/details';
//   static const String clubFilter = '$details/clubFilter';
//   static const String resultClubFilter = '$clubFilter/resultClubFilter';

//   static Route<dynamic>? onGenerateDetailsRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case details:
//         return MaterialPageRoute(builder: (_) => const DetailsView());
//       case clubFilter:
//         return MaterialPageRoute(builder: (_) => const FilterClubsView());
//       case resultClubFilter:
//         return MaterialPageRoute(builder: (_) => const ResultClubFilterView());

//       default:
//         return MaterialPageRoute(builder: (_) => const DetailsView());
//     }
//   }
// }

// abstract class SearchRoute {
//   static const String search = '/search';
//   static Route<dynamic>? onGenerateDetailsRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case search:
//         return MaterialPageRoute(builder: (_) => const SearchView());

//       default:
//         return MaterialPageRoute(builder: (_) => const ErrorRouteView());
//     }
//   }
// }

// abstract class FavoriteRoute {
//   static const String favorite = '/favorite';

//   static Route<dynamic>? onGenerateDetailsRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case favorite:
//         return MaterialPageRoute(builder: (_) => const FavoriteView());

//       default:
//         return MaterialPageRoute(builder: (_) => const ErrorRouteView());
//     }
//   }
// }
